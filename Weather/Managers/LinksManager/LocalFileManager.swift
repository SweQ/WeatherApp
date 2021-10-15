//
//  LocalFileManager.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

class LocalFileManager {
    static let shared = LocalFileManager()
    private init() { }
    var citiesJSON: URL? {
        get {
            guard let path = Bundle.main.path(forResource: "city.list", ofType: ".json") else { return nil}
            let url = URL(fileURLWithPath: path)
            return url
        }
        
    }
}
