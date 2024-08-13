//
//  WeatherAppDemoApp.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/12/24.
//

import SwiftUI

@main
struct WeatherAppDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentView.ViewModel())
        }
    }
}
