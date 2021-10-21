//
//  MainViewController+UITableViewDelegate.swift
//  Weather
//
//  Created by alexKoro on 8/30/21.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return modelView.citiesWithFilter.count
        } else {
            return modelView.weather?.daily.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = modelView.citiesWithFilter[indexPath.row].name
            return cell
            
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherTableViewCell") as? DailyWeatherTableViewCell,
              let dailyWeather = modelView.weather?.daily[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        cell.dateLabel.text = dailyWeather.date
        cell.morningTempLabel.text = dailyWeather.temp.temperatureMorning
        cell.dayTempLabel.text = dailyWeather.temp.temperatureDay
        cell.eveTempLabel.text = dailyWeather.temp.temperatureEve
        cell.nightTempLabel.text = dailyWeather.temp.temperatureNight
        DispatchQueue.global().async { [weak self] in
            self?.modelView.loadImage(name: dailyWeather.weather[0].icon) { image in
                cell.weatherImageView.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            let standartHeight = selectCityView.frame.height
            let countOfElements = modelView.citiesWithFilter.count
            
            if countOfElements > 5 {
                tableView.frame.size.height = standartHeight * 5
                return self.selectCityTableView.frame.height / 5
            } else if countOfElements == 0{
                tableView.frame.size.height = .zero
                return 0
            } else {
                tableView.frame.size.height = standartHeight * CGFloat(countOfElements)
                return self.selectCityTableView.frame.height / CGFloat(countOfElements)
            }
        }
        return self.view.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1 {
            let selectedCity = modelView.citiesWithFilter[indexPath.row]
            modelView.updateCurrentCity(with: selectedCity)
            cleareSelectCityView()
        }
    }
    
}

