//
//  SearchInteractor.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

final class SearchInteractor {
    
    // MARK: - VIPER Properties
    weak var output: SearchInteractorOutputProtocol?
    
    // MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol
    private let servicePath = "geo/1.0/direct"
    private let limitQueryDict = ["limit": "5"]
    private let cityQueryKey = "q"
    
    // MARK: - Inits
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

// MARK: - Input Protocol
extension SearchInteractor: SearchInteractorInputProtocol {
    func performSearch(with query: String) async {
        do {
            var queryItemsDict = [cityQueryKey: query]
            queryItemsDict.merge(limitQueryDict) { (current, _) in current }
            let searchResponse = try await networkManager.getRequest(
                entity: [CityEntity].self,
                path: servicePath,
                queryItemsDict: queryItemsDict
            )
            print("==>> searchResponse \(searchResponse)")
        } catch {
            print("==>> error \(error)")
        }
    }
}
