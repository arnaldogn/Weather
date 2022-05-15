//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import Foundation
import MapKit

class WeatherViewModel {
    
    var defaultLocation = CLLocationCoordinate2D(latitude: 61.2165586, longitude: -149.894838)
    
    let cityName = Box("Madrid")
    let forecastSummary = Box("Loading...")
    let icon: Box<UIImage?> = Box(nil)
    let currentTemperature = Box("")
    
    init() {
        fetchWeather()
    }
    
    func changeLocation(_ location: Location) {
        defaultLocation = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        cityName.value = location.name
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
