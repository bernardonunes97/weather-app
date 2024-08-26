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
    private var temperature: Double = 0
    var convertedTemperature: String {
        if isShowingCelsius {
            return "\(temperature)°C"
        } else {
            let convertedTemp = celsiusToFahrenheit(celsius: temperature)
            return "\(convertedTemp)°F"
        }
    }
    var isShowingCelsius = true {
        didSet {
            viewController?.setTemperature(temperature: convertedTemperature)
        }
    }
    
    // MARK: - Inits
    init(interactor: WeatherInteractorInputProtocol, cityModel: CityModel) {
        self.interactor = interactor
        self.cityModel = cityModel
    }
    
    // MARK: - Private Method
    private func celsiusToFahrenheit(celsius: Double) -> Double {
        return (celsius * 9 / 5) + 32
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
    func showError(with text: String) {
        viewController?.showError(with: text)
    }
    
    func setIcon(with data: Data) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.setIcon(with: .init(data: data))
        }
    }
    
    func setWeatherInfo(weather: WeatherModel) {
        temperature = weather.main.temp
        if let icon = weather.weather.first?.icon {
            interactor.loadIcon(for: icon)
        }
        DispatchQueue.main.async { [weak self] in
            guard let self else {
                return
            }
            self.viewController?.setWeatherInfo(
                description: weather.weather.first?.description ?? "",
                temperature: self.convertedTemperature
            )
        }
    }
}
