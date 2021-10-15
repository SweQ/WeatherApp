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
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 1
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        windInfoView.imageView.image = UIImage(named: "wind_png")
        humidityInfoView.imageView.image = UIImage(named: "humidity_png")
        pressureInfoView.imageView.image = UIImage(named: "barometer_png")
    }
    
}
