//
//  WeatherInteractorOutputProtocolSpy.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
@testable import weather_app

typealias WeatherInteractorOutputProtocolDummy = WeatherInteractorOutputProtocolSpy

final class WeatherInteractorOutputProtocolSpy: WeatherInteractorOutputProtocol {
    
    enum Methods: Equatable {
        case setWeatherInfo(weather: WeatherModel)
        case setIcon(data: Data)
    }
    
    /// An array with all called methods and accessed properties of the Spy.
    private(set) var calledMethods = [Methods]()
    
    func setWeatherInfo(weather: WeatherModel) {
        calledMethods.append(.setWeatherInfo(weather: weather))
    }
    
    func setIcon(with data: Data) {
        calledMethods.append(.setIcon(data: data))
    }
}
