//
//  WeatherProtocols.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import UIKit

// MARK: - ViewController
protocol WeatherPresenterOutputProtocol: AnyObject {
    func setWeatherInfo(description: String, temperature: String)
    func setIcon(with image: UIImage?)
    func showError(with text: String)
}

// MARK: - Presenter
protocol WeatherPresenterInputProtocol: AnyObject {
    var cityName: String { get }
    func fetchWeatherInfo()
}

// MARK: - Interactor
protocol WeatherInteractorInputProtocol: AnyObject {
    func fetchWeatherInfo(for city: CityModel)
    func loadIcon(for code: String)
}

protocol WeatherInteractorOutputProtocol: AnyObject {
    func setWeatherInfo(weather: WeatherModel)
    func setIcon(with data: Data)
    func showError(with text: String)
}
