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
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 2, height: 2)
        setupFonts()
    }
    
    private func setupFonts() {
        temperatureLabel.setAppStyle()
        timeLabel.setAppStyle()
    }

}
