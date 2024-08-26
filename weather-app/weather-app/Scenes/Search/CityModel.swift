//
//  CityModel.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

struct CityAPIModel: Decodable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String?
}

struct CityModel: Hashable {
    let nameToPresent: String
    let lat: Double
    let lon: Double
}

