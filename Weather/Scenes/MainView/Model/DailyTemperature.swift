//
//  DailyTemperature.swift
//  Weather
//
//  Created by alexKoro on 8/24/21.
//

import Foundation

struct DailyTemperature: Codable {
    private let day: Double
    private let min: Double
    private let max: Double
    private let night: Double
    private let eve: Double
    private let morn: Double
    var temperatureDay: String {
        return "\(day) ºС"
    }
    var temperatureMorning: String {
        return "\(morn) ºС"
    }
    var temperatureEve: String {
        return "\(eve) ºС"
    }
    var temperatureNight: String {
        return "\(night) ºС"
    }
}
