//
//  WeatherPresenter.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import UIKit

final class WeatherPresenter {
    
    // MARK: - Viper Properties
    weak var viewController: WeatherPresenterOutputProtocol?
    private let interactor: WeatherInteractorInputProtocol
    
    // MARK: - Properties
    private let cityModel: CityModel
    var cityName: String {
        cityModel.nameToPresent
    }
    
    // MARK: - Inits
    init(interactor: WeatherInteractorInputProtocol, cityModel: CityModel) {
        self.interactor = interactor
        self.cityModel = cityModel
    }
}

// MARK: - Input Protocol
extension WeatherPresenter: WeatherPresenterInputProtocol {
    func fetchWeatherInfo() {
        
    }
}

// MARK: - Output Protocol
extension WeatherPresenter: WeatherInteractorOutputProtocol {
    

}
