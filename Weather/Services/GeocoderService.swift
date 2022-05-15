//
//  GeocoderService.swift
//  Weather
//
//  Created by Arnaldo on 14/05/2022.
//

import Foundation
import CoreLocation

class GeocoderService {
    private lazy var geocoder = CLGeocoder()
    
    func geocode(addressString: String) async -> [Location] {
        let placemarks = try? await geocoder.geocodeAddressString(addressString)
        guard let placemarks = placemarks else { return [] }
        return placemarks.compactMap { (placemark) -> Location? in
            guard
                let name = placemark.locality,
                let location = placemark.location
            else {
                return nil
            }
            let region = placemark.administrativeArea ?? ""
            let fullName = "\(name), \(region)"
            return Location(
                name: fullName,
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude)
        }
    }
    
    func geocode(addressString: String, callback: @escaping ([Location]) -> ()) {
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            var locations: [Location] = []
            if let error = error {
                print("Geocoding error: (\(error))")
            } else {
                if let placemarks = placemarks {
                    locations = placemarks.compactMap { (placemark) -> Location? in
                        guard
                            let name = placemark.locality,
                            let location = placemark.location
                        else {
                            return nil
                        }
                        let region = placemark.administrativeArea ?? ""
                        let fullName = "\(name), \(region)"
                        return Location(
                            name: fullName,
                            latitude: location.coordinate.latitude,
                            longitude: location.coordinate.longitude)
                    }
                }
            }
            callback(locations)
        }
    }
}
