//
//  WeatherInteractorInputProtocolSpy.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
@testable import weather_app

typealias WeatherInteractorInputProtocolDummy = WeatherInteractorInputProtocolSpy

final class WeatherInteractorInputProtocolSpy: WeatherInteractorInputProtocol {

    enum Methods: Equatable {
        case fetchWeatherInfo(city: CityModel)
        case loadIcon(code: String)
    }

    /// An array with all called methods and accessed properties of the Spy.
    private(set) var calledMethods = [Methods]()
    
    func fetchWeatherInfo(for city: CityModel) {
        calledMethods.append(.fetchWeatherInfo(city: city))
    }
    
    func loadIcon(for code: String) {
        calledMethods.append(.loadIcon(code: code))
    }
}
