//
//  CoreDataManager.swift
//  Weather
//
//  Created by alexKoro on 20.10.21.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static let standart = CoreDataManager()
    
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { _, error in
            guard let error = error else { return }
            print("Container load error.")
        }
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        return context
    }()
    
    func save() {
        do {
         try viewContext.save()
        } catch {
            print("Core data save error.")
        }
    }
    func loadWeather(cityId: String) -> CacheWeathers? {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: Entities.CacheWeathers.rawValue)
        let predicate = NSPredicate(format: "cityId ='\(cityId)'")
        fetch.predicate = predicate
        guard let weathers = try? viewContext.fetch(fetch) as? [CacheWeathers] else { return nil}
        print("Count weathers in cahe: \(weathers.count)")
        return weathers.count > 0 ? weathers[0] : nil
    }
    
    func addWeatherToCache(cityId: String, date: Double,weather: Data) {
        let cacheWeather = CacheWeathers(context: viewContext)
        cacheWeather.weatherData = weather
        cacheWeather.cityId = cityId
        cacheWeather.weatherDate = date
        save()
        print("Weather added to cache.")
    }
    
    func addImageToCache(name: String, image: UIImage) {
        let imageForCache = CacheImages(context: viewContext)
        imageForCache.name = name
        imageForCache.image = image
        save()
        print("Image added to cache.")
    }
    
    func loadImageFromCache(name: String) -> UIImage? {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: Entities.CacheImages.rawValue)
        let predicate = NSPredicate(format: "name = '\(name)'")
        fetch.predicate = predicate
        guard let cacheImages = try? viewContext.fetch(fetch) as? [CacheImages] else {
            return nil
        }
        guard cacheImages.count > 0 else { return nil }
        guard let image = cacheImages[0].image else {
            return nil
        }
        print("Image load from cache.")
        return image
    }
    
    func clearCache(entity: Entities) {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity.rawValue)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try viewContext.execute(deleteRequest)
        } catch {
            print("ClearCache \(entity.rawValue) error.")
        }
    }
    
    func removeObjectFromCache(object: NSManagedObject) {
        viewContext.delete(object)
        save()
    }
    
}
