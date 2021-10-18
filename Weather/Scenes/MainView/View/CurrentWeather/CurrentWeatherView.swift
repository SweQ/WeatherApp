//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by alexKoro on 8/24/21.
//

import UIKit

class CurrentWeatherView: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var detalesView: UIView!
    @IBOutlet weak var windInfoView: DetailsWeatherView!
    @IBOutlet weak var humidityInfoView: DetailsWeatherView!
    @IBOutlet weak var pressureInfoView: DetailsWeatherView!
    
    @IBOutlet var viewLabels: [UILabel]!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        Bundle.init(for: CurrentWeatherView.self).loadNibNamed(String(describing: CurrentWeatherView.self), owner: self, options: nil)
        containerView.fixInContainer(self)
        windInfoView.imageView.image = UIImage(picture: .wind_png)
        humidityInfoView.imageView.image = UIImage(picture: .humidity_png)
        pressureInfoView.imageView.image = UIImage(picture: .barometer_png)
        setupFonts()
    }
    
    private func setupFonts() {
        for label in viewLabels {
            label.setAppStyle()
        }
    }
    
}
