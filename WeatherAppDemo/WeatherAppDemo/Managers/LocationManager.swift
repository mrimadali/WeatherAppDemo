//
//  LocationManager.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/12/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var manager: CLLocationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    

    override init() {
        super.init()
        self.manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        self.manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
        print("-----Received location: \(location?.latitude), \(location?.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("------Failed to fetch user's location: \(error.localizedDescription)")
        isLoading = false
    }
}
