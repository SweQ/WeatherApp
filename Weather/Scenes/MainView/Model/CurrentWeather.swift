//
//  CurrentWeather.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

struct CurrentWeather: Codable {
    
    private let dt: Double
    var date: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = .autoupdatingCurrent
            dateFormatter.dateStyle = .short
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
    private let feels_like: Double
    var temperature: String {
        return "\(temp) ºС"
    }
    var temperatureFeels: String {
        return "\(feels_like) ºС"
    }
    private let pressure: Double
    var pressureInfo: String {
        return "\(pressure) mm"
    }
    private let humidity: Double
    var humidityInfo: String {
        return "\(humidity) %"
    }
    private let wind_speed: Double
    var windSpeed: String {
        return "\(wind_speed) m/s"
    }
    let weather: [WeatherType]
}
