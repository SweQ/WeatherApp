//
//  MainViewModel.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    
    var didUpdateCurrentWeatherData: ((CurrentWeather) -> ())?
    var didUpdateDailyWeatherData: (([DailyWeather]) -> ())?
    var didUpdateHourlyWeatherData: (([HourlyWeather]) -> ())?
    
    private var citiesArray: [City] = []
    var city: City? {
        get {
            return currentCity
        }
    }
    private var currentCity: City? {
        didSet {
            guard let city = currentCity else { return }
            updateWeatherData(from: city)
        }
    }
    
    var cities: [City] {
        get {
            return citiesArray
        }
    }
    
    var cityFilter: String = "" {
        didSet {
            citiesWithFilter = citiesArray.filter({ (city) -> Bool in
                if city.name.hasPrefix(cityFilter) {
                    return true
                }
                return false
            })
        }
    }
    
    var citiesWithFilter: [City] = []
    
    private var weatherData: OpenWeatherMapOneCallAPI? {
        didSet {
            guard let weather = weatherData else { return }
            didUpdateDailyWeatherData?(weather.daily)
            didUpdateCurrentWeatherData?(weather.current)
            didUpdateHourlyWeatherData?(weather.hourlyWeather)
        }
    }
    
    var weather: OpenWeatherMapOneCallAPI? {
        get {
            return self.weatherData
        }
    }
    
    init() {
        initializationCities()
        updateCurrentCityWithCurrentLocation()
    }
    
    private func initializationCities() {
        guard let citiesFileURL = LocalFileManager.shared.citiesJSON,
              let data = try? Data(contentsOf: citiesFileURL),
              let cities = try? JSONDecoder().decode([City].self, from: data)
        else {
            print("Error! initializationCities() - nill")
            return
        }
        
        citiesArray = cities
        print(citiesArray.count)
    }
    
    private func updateWeatherData(from city: City) {
        guard let url = OpenWeatherMapLinksManager.shared.getOneCallAPI(with: city) else { return }
        NetworkManager.shared.makeRequest(with: url) { [unowned self] data in
            guard let weather = try? JSONDecoder().decode(
                    OpenWeatherMapOneCallAPI.self,
                    from: data ?? Data()
            ) else {
                print("Error! updateWeatherData() - JSON().decode is nill")
                return
            }
            weatherData = weather
        }
    }
    
    
    
    private func updateCurrentCity(with coordinates: Coordinates) {
        guard let url = OpenWeatherMapLinksManager.shared.getCitiesAPI(with: coordinates) else { return }
        NetworkManager.shared.makeRequest(with: url) { [unowned self] (data) in
            guard let data = data,
                  let citiesCoordinates = try? JSONDecoder().decode([Coordinates].self, from: data),
                  let cityCoordinate = citiesCoordinates.first
            else {
                print("Error! setCurrentCity - nill")
                return
            }
            
            currentCity = cities.first {
                Double(round($0.coord.lat * 10000)/10000) == cityCoordinate.lat &&
                Double(round($0.coord.lon * 10000)/10000) == cityCoordinate.lon
            }
        }
    }
    
    func updateCurrentCity(with city: City) {
        currentCity = city
    }
    
    func updateCurrentCityWithCurrentLocation() {
        let clManager = LocationManager.shared
        clManager.updatingLocation { [unowned self] currentCoordinates in
            self.updateCurrentCity(with: currentCoordinates)
        }
    }
    
}
