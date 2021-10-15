//
//  UILabel+setAppStyle.swift
//  Weather
//
//  Created by alexKoro on 15.10.21.
//

import UIKit

extension UILabel {
    func setAppStyle() {
        self.font = UIFont(name: "JafelineHand", size: 23)
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 2 / self.font.pointSize
    }
}
