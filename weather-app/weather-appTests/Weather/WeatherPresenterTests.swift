//
//  WeatherPresenterTests.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import XCTest
@testable import weather_app
import UIKit

final class WeatherPresenterTests: XCTestCase {
    
    private let cityName = "Test"
    private var cityModel: CityModel {
        CityModel(nameToPresent: cityName, lat: 0, lon: 0)
    }
    private let weatherDescription = "Description Test"
    private let temperature: Double = 0
    private let iconCode = "Icon Test"
    private var weaetherModel: WeatherModel {
        WeatherModel(weather: [.init(description: weatherDescription, icon: iconCode)], main: .init(temp: temperature))
    }
    
    func test_fetchWeather() {
        let (sut, doubles) = makeSUT()
        
        sut.fetchWeatherInfo()
        
        XCTAssertEqual(doubles.viewContollerSpy.calledMethods, [])
        XCTAssertEqual(doubles.interactorSpy.calledMethods, [
            .fetchWeatherInfo(city: cityModel)
        ])
    }
    
    func test_setWeatherInfo() {
        let (sut, doubles) = makeSUT()
        
        sut.setWeatherInfo(weather: weaetherModel)
        
        XCTAssertEqual(doubles.interactorSpy.calledMethods, [
            .loadIcon(code: iconCode)
        ])
    }
}

// MARK: - makeSUT
private extension WeatherPresenterTests {
    typealias SutAndDoubles = (
        sut: WeatherPresenter,
        doubles: (
            interactorSpy: WeatherInteractorInputProtocolSpy,
            viewContollerSpy: WeatherPresenterOutputProtocolSpy
        )
    )
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> SutAndDoubles {
        let interactorSpy = WeatherInteractorInputProtocolSpy()
        let viewContollerSpy = WeatherPresenterOutputProtocolSpy()
        let sut = WeatherPresenter(interactor: interactorSpy, cityModel: cityModel)
        sut.viewController = viewContollerSpy

        return (sut, (interactorSpy, viewContollerSpy))
    }
}
