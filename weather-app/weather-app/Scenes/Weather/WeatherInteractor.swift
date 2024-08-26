//
//  WeatherInteractor.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import UIKit

final class WeatherInteractor {
    
    // MARK: - VIPER Properties
    weak var output: WeatherInteractorOutputProtocol?
    
    // MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol
    private let weatherServicePath = "data/2.5/weather"
    private let unitsDict = ["units": "metric"]
    
    // MARK: - Inits
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

// MARK: - Input Protocol
extension WeatherInteractor: WeatherInteractorInputProtocol {
    func loadIcon(for code: String) {
        Task {
            do  {
                let icon = try await networkManager.getIconRequest(iconCode: code)
                output?.setIcon(with: icon)
            } catch {
                print("==>> error \(error)")
            }
            
        }
    }
    
    func fetchWeatherInfo(for city: CityModel) {
        Task {
            var queryItems = [
                "lat": "\(city.lat)",
                "lon": "\(city.lon)",
            ]
            queryItems.merge(self.unitsDict) { (current, _) in current }
            do  {
                let weather = try await networkManager.getRequest(
                    entity: WeatherModel.self,
                    path: weatherServicePath,
                    queryItemsDict: queryItems
                )
                output?.setWeatherInfo(weather: weather)
            } catch {
                print("==>> error \(error)")
            }
            
        }
    }
}
