//
//  CityEntity.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

struct CityEntity: Decodable {
    let name: String
    let lat: Double
    let lon: Double
    let state: String
    let country: String
}
