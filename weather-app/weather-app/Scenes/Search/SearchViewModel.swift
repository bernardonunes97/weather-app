//
//  SearchViewModel.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published private (set) var cities: [CityModel] = []
    @Published private (set) var isLoading: Bool = false
    @Published private (set) var errorDescription: String?
    
    // MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    private let servicePath = "geo/1.0/direct"
    private let limitQueryDict = ["limit": "5"]
    private let cityQueryKey = "q"
    var selectedCity: CityModel?
    
    // MARK: - Inits
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension SearchViewModel {
    
    /// Method to perform get request for a city
    /// - Parameter query: string that should be used to make the search
    func performSearch(with query: String) {
        isLoading = true
        Task {
            do {
                var queryItemsDict = [cityQueryKey: query]
                queryItemsDict.merge(limitQueryDict) { (current, _) in current }
                let searchResponse = try await networkManager.getRequest(
                    entity: [CityAPIModel].self,
                    path: servicePath,
                    queryItemsDict: queryItemsDict
                )
                DispatchQueue.main.async { [weak self] in
                    self?.setCities(citiesAPI: searchResponse)
                }
                
            } catch {
                isLoading = false
                print("==>> error \(error)")
            }

        }
    }
    
    /// Method to clear the cities retrieved
    func clearCities() {
        cities.removeAll()
    }
    
    /// Method to set the cities and transform its model to a user friendly model
    /// - Parameter citiesAPI: array of cities returned by the API
    private func setCities(citiesAPI: [CityAPIModel]) {
        isLoading = false
        cities = citiesAPI.map { city in
            var nameToPresent = city.name
            if let state = city.state {
                nameToPresent.append(" - \(state)")
            }
            nameToPresent.append(" - \(city.country)")
            return CityModel(
                nameToPresent: nameToPresent,
                lat: city.lat,
                lon: city.lon
            )
        }
    }
}
