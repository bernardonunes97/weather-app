//
//  WeatherProtocols.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation

// MARK: - ViewController
protocol WeatherPresenterOutputProtocol: AnyObject {
 
}

// MARK: - Presenter
protocol WeatherPresenterInputProtocol: AnyObject {
    var cityName: String { get }
    func fetchWeatherInfo()
}

// MARK: - Interactor
protocol WeatherInteractorInputProtocol: AnyObject {

}

protocol WeatherInteractorOutputProtocol: AnyObject {
 
}
