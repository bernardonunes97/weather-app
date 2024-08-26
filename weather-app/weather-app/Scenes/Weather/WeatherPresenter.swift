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
        interactor.fetchWeatherInfo(for: cityModel)
    }
}

// MARK: - Output Protocol
extension WeatherPresenter: WeatherInteractorOutputProtocol {
    func setIcon(with data: Data) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.setIcon(with: .init(data: data))
        }
    }
    
    func setWeatherInfo(weather: WeatherModel) {
        if let icon = weather.weather.first?.icon {
            interactor.loadIcon(for: icon)
        }
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.setWeatherInfo(
                description: weather.weather.first?.description ?? "",
                temperature: "\(weather.main.temp)°C"
            )
        }
    }
}
