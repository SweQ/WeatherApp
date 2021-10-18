//
//  DailyWeatherTableViewCell.swift
//  Weather
//
//  Created by alexKoro on 8/30/21.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var morningTempLabel: UILabel!
    @IBOutlet weak var dayTempLabel: UILabel!
    @IBOutlet weak var eveTempLabel: UILabel!
    @IBOutlet weak var nightTempLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    @IBOutlet weak var eveLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupFonts() {
        dayTempLabel.setAppStyle()
        eveTempLabel.setAppStyle()
        nightTempLabel.setAppStyle()
        morningTempLabel.setAppStyle()
        dateLabel.setAppStyle()
        morningLabel.setAppStyle()
        dayLabel.setAppStyle()
        eveLabel.setAppStyle()
        nightLabel.setAppStyle()
        
    }
    
}
