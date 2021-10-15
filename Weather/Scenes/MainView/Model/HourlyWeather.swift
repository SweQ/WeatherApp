//
//  HourlyWeather.swift
//  Weather
//
//  Created by alexKoro on 8/24/21.
//

import Foundation
import UIKit

struct HourlyWeather: Codable {
    private let dt: Double
    var isToday: Bool {
        let date = Date(timeIntervalSince1970: dt)
        let calendar = Calendar.current
        let dayFromWeather = calendar.dateComponents([.day], from: date)
        let dayFromNowDate = calendar.dateComponents([.day], from: Date())
        
        return dayFromWeather.day == dayFromNowDate.day
    }
    
    var time: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = .autoupdatingCurrent
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            
            let stringDate = dateFormatter.string(
                from: Date(
                    timeIntervalSince1970: dt
                )
            )
            
            return stringDate
        }
    }
    
    private let temp: Double
    var temperature: String {
        return "\(temp) ºС"
    }
    private let feels_like: Double
    var temperatureFeels: String {
        return "\(feels_like) ºС"
    }
    let weather: [WeatherType]
}
