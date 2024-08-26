//
//  WeatherPresenterOutputProtocolSpy.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import UIKit
@testable import weather_app

typealias WeatherPresenterOutputProtocolDummy = WeatherPresenterOutputProtocolSpy

final class WeatherPresenterOutputProtocolSpy: WeatherPresenterOutputProtocol {
    
    enum Methods: Equatable {
        case setWeatherInfo(description: String, temperature: String)
        case setIcon(image: UIImage?)
    }
    
    /// An array with all called methods and accessed properties of the Spy.
    private(set) var calledMethods = [Methods]()
    
    func setWeatherInfo(description: String, temperature: String) {
        calledMethods.append(.setWeatherInfo(description: description, temperature: temperature))
    }
    
    func setIcon(with image: UIImage?) {
        calledMethods.append(.setIcon(image: image))
    }
}
