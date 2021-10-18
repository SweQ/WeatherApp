//
//  SelectCityView.swift
//  Weather
//
//  Created by alexKoro on 8/25/21.
//

import UIKit

class SelectCityView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentLocationButton: UIButton!
    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        Bundle.init(for: SelectCityView.self).loadNibNamed(String(describing: SelectCityView.self), owner: self, options: nil)
        contentView.fixInContainer(self)
        cityNameTextField.isHidden = true
        currentLocationButton.isHidden = true
        setupFonts()
    }
    
    private func setupFonts() {
        cityNameLabel.setAppStyle()
    }
}
