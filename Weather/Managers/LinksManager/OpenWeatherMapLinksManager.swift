//
//  OpenWeatherMapLinksManager.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

class OpenWeatherMapLinksManager {
    static let shared = OpenWeatherMapLinksManager()
    private let appID: String = "0cbde317a367e026bd7b7282045b84a5"
    private init() { }
    func getOneCallAPI(with city: City) -> URL? {
        let url = URL(
            string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(city.coord.lat)&lon=\(city.coord.lon)&exclude=minutely,alerts&units=metric&appid=\(appID)")
        return url
    }
    
    func getCitiesAPI(with coordinates: Coordinates) -> URL? {
        let url = URL(string: "https://api.openweathermap.org/geo/1.0/reverse?lat=\(coordinates.lat)&lon=\(coordinates.lon)&limit=1&appid=\(appID)")
        return url
    }
    
    func getImageAPI(with name: String) -> URL? {
        let url = URL(string: "https://openweathermap.org/img/wn/\(name)@4x.png")
        return url
    }
}
