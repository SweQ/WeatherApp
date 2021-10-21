//
//  CacheImages+CoreDataProperties.swift
//  Weather
//
//  Created by alexKoro on 21.10.21.
//
//

import Foundation
import CoreData
import UIKit


extension CacheImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheImages> {
        return NSFetchRequest<CacheImages>(entityName: "CacheImages")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: UIImage?

}

extension CacheImages : Identifiable {

}
