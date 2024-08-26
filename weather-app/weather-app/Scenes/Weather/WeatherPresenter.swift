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
    
    // MARK: - Inits
    init(interactor: WeatherInteractorInputProtocol) {
        self.interactor = interactor
    }
}

// MARK: - Input Protocol
extension WeatherPresenter: WeatherPresenterInputProtocol {

}

// MARK: - Output Protocol
extension WeatherPresenter: WeatherInteractorOutputProtocol {
    

}
