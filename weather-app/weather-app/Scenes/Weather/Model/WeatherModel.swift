//
//  WeatherModel.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation

struct WeatherModel: Decodable, Equatable {
    let weather: [WeatherDescriptionModel]
    let main: TemperatureModel
}
