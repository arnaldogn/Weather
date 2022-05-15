//
//  FakeWeatherService.swift
//  WeatherTests
//
//  Created by Arnaldo on 15/05/2022.
//

import Foundation
@testable import Weather

class FakeWeatherService: WeatherServiceProtocol {
    var weatherbitData: WeatherbitData {
        let weather = WeatherbitData.Observation.Weather(icon: "", description: "Jodido")
        let obsevation = WeatherbitData.Observation(temp: 26, datetime: "", weather: weather)
        return WeatherbitData(observation: [obsevation])
    }
    
    func fetchWeather(latitude: Double, longitude: Double) async throws -> WeatherbitData {
        return weatherbitData
    }
    
    func fetchWeather(latitude: Double, longitude: Double, completion: @escaping WeatherCompletion) {
        completion(weatherbitData, nil)
    }
}
