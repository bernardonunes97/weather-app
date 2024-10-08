//
//  WeatherDescriptionModel.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation

struct WeatherDescriptionModel: Decodable, Equatable {
    let description: String
    let icon: String
}
