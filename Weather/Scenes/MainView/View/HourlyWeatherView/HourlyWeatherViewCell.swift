//
//  HourlyWeatherViewCell.swift
//  Weather
//
//  Created by alexKoro on 8/25/21.
//

import UIKit

class HourlyWeatherViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
    }
    
    private func setupFonts() {
        temperatureLabel.setAppStyle()
        timeLabel.setAppStyle()
    }

}
