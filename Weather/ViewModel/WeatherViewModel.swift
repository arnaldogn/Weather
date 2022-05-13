//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import Foundation
import MapKit

class WeatherViewModel {
    
    let defaultLocation = CLLocationCoordinate2D(latitude: 61.2165586, longitude: -149.894838)
    
    let forecastSummary = Box("Loading...")
    let icon: Box<UIImage?> = Box(nil)
    let currentTemperature = Box("")
    
    init() {
        fetchWeather()
    }
        
    func fetchWeather() {
        WeatherService.fetchWeather(latitude: defaultLocation.latitude, longitude: defaultLocation.longitude) { [weak self] weatherData, error in
            guard let weatherData = weatherData,
                  let self = self
            else { return  }
            
            self.forecastSummary.value = "Summary: \(weatherData.description)"
            self.icon.value = UIImage(named: weatherData.iconName)
            self.currentTemperature.value = "\(weatherData.currentTemp) F"
        }
    }
}