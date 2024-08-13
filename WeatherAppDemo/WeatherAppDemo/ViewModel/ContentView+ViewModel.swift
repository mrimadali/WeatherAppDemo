//
//  ContentView+ViewModel.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/12/24.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        let weatherRepository: WeatherRepository
        init(weatherRepository: WeatherRepository = WeatherRepository.shared) {
            self.weatherRepository = weatherRepository
        }
        @Published var weatherData: WeatherModel? = nil
        @Published var isLoading: Bool = false


        func fetchWeatherData(_ latitude: Double, longitude: Double) {
            isLoading = true
            print("------fetchWeatherData------")

            Task {
                let result = await self.weatherRepository.fetchWeather(latitude, longitude: longitude)
                self.isLoading = false
                
                switch result {
                case let .success(weatherData):
                    print("-----fetchWeatherData.success: \(weatherData)")
                    self.weatherData = weatherData
                case let .failure(error):
                    print("------fetchWeatherData.fail: \(error)")
                }
            }
        }
    }
}
