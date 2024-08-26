//
//  WeatherViewControllerTests.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import XCTest
@testable import weather_app
import UIKit

final class WeatherViewControllerTests: XCTestCase {
    
    func test_viewDidLoad() {
        let (sut, presenterSpy) = makeSUT()
        
        let _ = sut.view
        
        XCTAssertEqual(presenterSpy.calledMethods, [
            .fetchWeatherInfo, .cityName
        ])
    }
}

// MARK: - makeSUT
private extension WeatherViewControllerTests {
    typealias SutAndDoubles = (
        sut: WeatherViewController,
        presenterSpy: WeatherPresenterInputProtocolSpy
    )
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> SutAndDoubles {
        let presenterSpy = WeatherPresenterInputProtocolSpy()
        let sut = WeatherViewController(presenter: presenterSpy)

        return (sut, presenterSpy)
    }
}
