//
//  NetworkManagerProtocol.swift
//  Weather
//
//  Created by alexKoro on 8/23/21.
//

import Foundation

protocol NetworkManagerProtocol {
    static var shared: NetworkManagerProtocol { get }
    func makeRequest(with url: URL, completion: @escaping (Data?) -> ())
}
