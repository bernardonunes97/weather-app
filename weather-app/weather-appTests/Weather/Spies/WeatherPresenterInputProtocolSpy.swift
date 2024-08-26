//
//  WeatherPresenterInputProtocolSpy.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
@testable import weather_app

typealias WeatherPresenterInputProtocolDummy = WeatherPresenterInputProtocolSpy

final class WeatherPresenterInputProtocolSpy: WeatherPresenterInputProtocol {
    
    enum Methods: Equatable {
        case cityName
        case fetchWeatherInfo
    }
    
    /// An array with all called methods and accessed properties of the Spy.
    private(set) var calledMethods = [Methods]()
    
    var cityNameToReturn: String = ""
    var cityName: String {
        calledMethods.append(.cityName)
        return cityNameToReturn
    }
    
    func fetchWeatherInfo() {
        calledMethods.append(.fetchWeatherInfo)
    }
}
