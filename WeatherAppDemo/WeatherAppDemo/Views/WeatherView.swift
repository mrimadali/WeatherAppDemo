//
//  WeatherView.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/13/24.
//

import SwiftUI

struct WeatherView: View {
    var weatherData: WeatherModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                if let displayName = weatherData.location?.displayName {
                    Text(displayName)
                        .font(.title).bold()
                }
                
                if let currentDate = weatherData.location?.localtime?.displayFormat() {
                    Text(currentDate)
                        .font(.subheadline)
                }
            }
            .padding([.leading, .top], 10)
            
            
            HStack {
                VStack {
                    if let urlString = weatherData.current?.condition?.icon {
                        let appendURL = "https:\(urlString)"
                        let url = URL(string: appendURL)
                        AsyncImage(url: url)
                            .frame(width: 100, height: 100)
                    }
                    if let status = weatherData.current?.condition?.text {
                        Text(status)
                            .font(.title3).bold()
                    }
                }
                if let degrees = weatherData.current?.tempC, let farenhit = weatherData.current?.tempF {
                    let temp = String(format: "%.1f ℃  /  %.1f  ℉", degrees, farenhit)
                    
                    Text(temp)
                        .font(.largeTitle)
                }
            }
            if let feelsLikeC = weatherData.current?.feelslikeC, let feelsLikeF = weatherData.current?.feelslikeF  {
                let temp = String(format: " Feels like %.1f ℃  /  %.1f  ℉", feelsLikeC, feelsLikeF)
                
                Text(temp)
                    .font(.subheadline)
                    .padding(.top, 30)
            }
            Spacer()
            
            if let last_updated = weatherData.current?.lastUpdated?.displayFormat() {
                let lastUpdated = String(format: "Last updated: %@", last_updated)
                Text(lastUpdated)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
        .padding()
        .background(Color.accentColor)
    }
}
