//
//  WeatherRepository.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/12/24.
//

import Foundation
import SwiftNetworking

protocol WeatherProtocol {
    func fetchWeather(_ latitude: Double, longitude: Double) async -> Result<WeatherModel, APIError>
}

class WeatherRepository: WeatherProtocol {
    static let shared = WeatherRepository()
    
    let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager.shared) {
        self.manager = manager
    }
    
    func fetchWeather(_ latitude: Double, longitude: Double) async -> Result<WeatherModel, APIError> {
        return await manager.execute(ProductEndpoint.getWeatherAppData(latitude, longitude))
    }
}
