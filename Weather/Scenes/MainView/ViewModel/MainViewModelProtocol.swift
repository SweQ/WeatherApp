//
//  MainViewModelProtocol.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

protocol MainViewModelProtocol {
    var didUpdateCurrentWeatherData: ((CurrentWeather) -> ())? { get set }
    var didUpdateDailyWeatherData: (([DailyWeather]) -> ())? { get set }
    var didUpdateHourlyWeatherData: (([HourlyWeather]) -> ())? { get set }
}
