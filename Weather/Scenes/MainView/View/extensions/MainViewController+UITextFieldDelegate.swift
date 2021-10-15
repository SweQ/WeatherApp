//
//  MainViewController+UITextFieldDelegate.swift
//  Weather
//
//  Created by alexKoro on 8/31/21.
//

import Foundation
import UIKit

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cleareSelectCityView()
        return true
    }
}
