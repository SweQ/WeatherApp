//
//  DetailsWeatherView.swift
//  Weather
//
//  Created by alexKoro on 8/25/21.
//

import UIKit

class DetailsWeatherView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        Bundle.init(for: DetailsWeatherView.self).loadNibNamed(String(describing: DetailsWeatherView.self), owner: self, options: nil)
        //self.layer.masksToBounds = true
        contentView.fixInContainer(self)
        setupFonts()
    }
    
    private func setupFonts() {
        descriptionLabel.setAppStyle()
    }

}
