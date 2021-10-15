//
//  OpenWeatherMapOneCallAPI.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

struct OpenWeatherMapOneCallAPI: Codable {
    let current: CurrentWeather
    let daily: [DailyWeather]
    private let hourly: [HourlyWeather]
    var hourlyWeather: [HourlyWeather] {
        get {
            let weatherHourly = hourly.filter { (weather) -> Bool in
                return weather.isToday
            }
            return weatherHourly
        }
    }
}




