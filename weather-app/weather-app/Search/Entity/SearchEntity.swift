//
//  SearchEntity.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

struct SearchEntity: Decodable {
    let cities: [CityEntity]
}
