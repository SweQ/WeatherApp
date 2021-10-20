//
//  CacheWeathers+CoreDataProperties.swift
//  Weather
//
//  Created by alexKoro on 20.10.21.
//
//

import Foundation
import CoreData


extension CacheWeathers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheWeathers> {
        return NSFetchRequest<CacheWeathers>(entityName: "CacheWeathers")
    }

    @NSManaged public var weatherDate: Double
    @NSManaged public var weatherData: Data?
    @NSManaged public var cityId: String?

}

extension CacheWeathers : Identifiable {

}
