//
//  LocationManager.swift
//  Weather
//
//  Created by alexKoro on 8/24/21.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    private let clManager = CLLocationManager()
    private var currentLocation: Coordinates? {
        didSet {
            guard let currentLocation = currentLocation else {
                return
            }
            self.updateLocationCompletion?(currentLocation)
        }
    }
    private var updateLocationCompletion: ((Coordinates) -> ())?
    
    private override init() {
        super.init()
        clManager.delegate = self
        clManager.desiredAccuracy = kCLLocationAccuracyKilometer
        clManager.requestWhenInUseAuthorization()
    }
    
    func updatingLocation(completion: @escaping (Coordinates) -> () ) {
        self.updateLocationCompletion = completion
        clManager.delegate = self
        clManager.startUpdatingLocation()
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        //set delegate = nil to avoid double call
        manager.delegate = nil
        guard let lon = locations.first?.coordinate.longitude,
              let lat = locations.first?.coordinate.latitude
        else {
            return
        }
        self.currentLocation = Coordinates(lat: lat, lon: lon)
    }
    
    internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined, .denied, .restricted:
            return
        default:
            manager.startUpdatingLocation()
        }
    }
}
