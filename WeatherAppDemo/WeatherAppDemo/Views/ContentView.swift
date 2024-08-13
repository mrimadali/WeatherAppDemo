//
//  ContentView.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var viewModel: Self.ViewModel

    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weatherData = viewModel.weatherData {
                    WeatherView(weatherData: weatherData)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }else {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.white)
                        .onAppear {
                            viewModel.fetchWeatherData(Double(location.latitude), longitude: Double(location.longitude))
                        }
                }
            }else {
                if locationManager.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.white)
                }else {
                    WelcomeView()
                         .environmentObject(locationManager)
                }
            }
        }
        .background(Color.accentColor)
    }
}

#Preview {
    ContentView(viewModel: ContentView.ViewModel())
}
