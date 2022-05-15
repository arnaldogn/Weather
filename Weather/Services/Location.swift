//
//  Location.swift
//  Weather
//
//  Created by Arnaldo on 14/05/2022.
//

import CoreLocation

struct Location {
  let name: String
  let latitude: Double
  let longitude: Double
  
  var location: CLLocation {
    return CLLocation(latitude: latitude, longitude: longitude)
  }
}
