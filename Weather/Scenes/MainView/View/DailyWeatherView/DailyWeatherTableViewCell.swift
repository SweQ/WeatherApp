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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupFonts() {
        dayTempLabel.setAppStyle()
        eveTempLabel.setAppStyle()
        nightTempLabel.setAppStyle()
        morningTempLabel.setAppStyle()
    }
    
}
