//
//  WeatherInteractor.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import UIKit

final class WeatherInteractor {
    
    // MARK: - VIPER Properties
    weak var output: WeatherInteractorOutputProtocol?
    
    // MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol
    
    // MARK: - Inits
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

// MARK: - Input Protocol
extension WeatherInteractor: WeatherInteractorInputProtocol {
    
}
