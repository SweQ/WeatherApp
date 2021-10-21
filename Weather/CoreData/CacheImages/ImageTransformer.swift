//
//  ImageTransformer.swift
//  Weather
//
//  Created by alexKoro on 21.10.21.
//

import UIKit
import CoreData

class ImageTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else {
            return nil
        }
        let data = image.pngData()
        return data
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let value = value as? Data else {
            return nil
        }
        guard let image = UIImage(data: value) else {
            return nil
        }
        return image
    }
}
