//
//  CityViewModel.swift
//  Weather
//
//  Created by Arnaldo on 14/05/2022.
//

import Foundation

class CityViewModel {
    let geocoder = GeocoderService()
    let locations: Box<[Location]?> = Box(nil)
    
    init(_ city: String? = nil) {
        guard let city = city else {
            return
        }
        fetchCity(city)
    }
    
    func fetchCity(_ name: String) {
        Task.init {
            let cities = await geocoder.geocode(addressString: name)
            locations.value = cities
        }
    }
}
