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
    
    // MARK: - Inits
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

// MARK: - Input Protocol
extension SearchInteractor: SearchInteractorInputProtocol {
    func performSearch(with query: String) {
        print("===>> \(query)")
    }
}
