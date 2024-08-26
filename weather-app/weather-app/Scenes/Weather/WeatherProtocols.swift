//
//  WeatherProtocols.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation

// MARK: - ViewController
protocol WeatherPresenterOutputProtocol: AnyObject {
    func setWeatherInfo(description: String, temperature: String)
}

// MARK: - Presenter
protocol WeatherPresenterInputProtocol: AnyObject {
    var cityName: String { get }
    func fetchWeatherInfo()
}

// MARK: - Interactor
protocol WeatherInteractorInputProtocol: AnyObject {
    func fetchWeatherInfo(for city: CityModel)
}

protocol WeatherInteractorOutputProtocol: AnyObject {
    func setWeatherInfo(weather: WeatherModel)
}
