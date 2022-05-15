//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import Foundation
import MapKit

class WeatherViewModel {
    
    private var defaultLocation = CLLocationCoordinate2D(latitude: 61.2165586, longitude: -149.894838)
    
    let cityName = Box("Madrid")
    let forecastSummary = Box("Loading...")
    let icon: Box<UIImage?> = Box(nil)
    let currentTemperature = Box("")
    
    private let service: WeatherServiceProtocol
    
    init(service: WeatherServiceProtocol) {
        self.service = service
        fetchWeather()
    }
    
    func changeLocation(_ location: Location) {
        defaultLocation = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        cityName.value = location.name
        fetchWeather()
    }
        
    private func fetchWeather() {
        Task.init {
            let weatherData = try? await service.fetchWeather(latitude: defaultLocation.latitude, longitude: defaultLocation.longitude)
            guard let weatherData = weatherData else { return }
            forecastSummary.value = "Summary: \(weatherData.description)"
            icon.value = UIImage(named: weatherData.iconName)
            currentTemperature.value = "\(weatherData.currentTemp) F"
        }
    }
}
