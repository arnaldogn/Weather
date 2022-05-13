//
//  WeatherService.swift
//  Weather
//
//  Created by Allen Gilliam on 13/5/22.
//

import Foundation

enum WeatherError: Error {
    case noData
}

typealias WeatherCompletion = (WeatherbitData?, WeatherError?) -> ()

protocol WeatherServiceProtocol {
    static func fetchWeather(latitude: Double, longitude: Double, completion: @escaping WeatherCompletion)
}

class WeatherService: WeatherServiceProtocol {
    private static let apiKey = "9a8e59b84c754008aca1a9be88e0de5f"
    private static let host = "api.weatherbit.io"
    private static let path = "/v2.0/current"
    private static let fahrenheit = "I"
    
    static func fetchWeather(latitude: Double, longitude: Double, completion: @escaping WeatherCompletion) {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = host
        urlBuilder.path = path
        
        urlBuilder.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "units", value: fahrenheit),
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)")]
        
        URLSession.shared.dataTask(with: urlBuilder.url!) { data, response, error in
            guard let data = data else {
                return completion(nil, .noData)
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherbitData.self, from: data)
                completion(weatherData, nil)
            } catch {
                completion(nil, .noData)
            }
            
        }.resume()
    }
}