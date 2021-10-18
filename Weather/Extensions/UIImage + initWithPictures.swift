//
//  UIImage + initWithPictures.swift
//  Weather
//
//  Created by alexKoro on 18.10.21.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(picture: Pictures) {
        
        self.init(named: picture.rawValue)
    }
}
