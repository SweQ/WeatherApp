//
//  NetworkManager.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    static var shared: NetworkManagerProtocol = NetworkManager()
    
    private init() { }
    
    func makeRequest(with url: URL, completion: @escaping  (Data?) -> () ) {
    
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            
            if let _ = error {
                print("ERROR: NetworkManager.getData(from: \(url))")
                return
            }
            completion(data)
        }.resume()
    }
    
}
