//
//  UIView+fixInContainer.swift
//  Weather
//
//  Created by alexKoro on 8/25/21.
//

import UIKit

extension UIView {
    func fixInContainer(_ container: UIView) {
        self.frame = container.bounds
        container.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .right, relatedBy: .equal, toItem: container, attribute: .right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: self, attribute: .left, relatedBy: .equal, toItem: container, attribute: .left, multiplier: 1, constant: 0).isActive = true
    }
}
