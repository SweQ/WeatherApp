//
//  DailyWeather.swift
//  Weather
//
//  Created by alexKoro on 8/24/21.
//

import Foundation

struct DailyWeather: Codable {
    private let dt: Double
    var date: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = .autoupdatingCurrent
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            
            let stringDate = dateFormatter.string(
                from: Date(
                    timeIntervalSince1970: dt
                )
            )
            
            return stringDate
        }
    }
    let temp: DailyTemperature
    private let pressure: Double
    private let humidity: Double
    private let wind_speed: Double
    let weather: [WeatherType]
}
