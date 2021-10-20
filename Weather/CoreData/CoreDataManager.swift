//
//  CoreDataManager.swift
//  Weather
//
//  Created by alexKoro on 20.10.21.
//

import Foundation
import CoreData

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
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CacheWeathers")
        let predicate = NSPredicate(format: "cityId ='\(cityId)'")
        fetch.predicate = predicate
        guard let weathers = try? viewContext.fetch(fetch) as? [CacheWeathers] else { return nil}
        print("Count rows in base: \(weathers.count)")
        return weathers.count > 0 ? weathers[0] : nil
    }
    
    func addToBase(cityId: String, date: Double,weather: Data) {
        let cacheWeather = CacheWeathers(context: viewContext)
        cacheWeather.weatherData = weather
        cacheWeather.cityId = cityId
        cacheWeather.weatherDate = date
        save()
        print("Add to base")
    }
    
    func clearCache() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CacheWeathers")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try viewContext.execute(deleteRequest)
        } catch {
            print("ClearCache error.")
        }
    }
    
    func removeWeather(cacheWeather: CacheWeathers) {
        viewContext.delete(cacheWeather)
        save()
    }
    
}
