//
//  SearchPresenter.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

final class SearchPresenter {
    
    // MARK: - Viper Properties
    private let interactor: SearchInteractorInputProtocol
    
    // MARK: - Inits
    init(interactor: SearchInteractorInputProtocol) {
        self.interactor = interactor
    }
}

// MARK: - Input Protocol
extension SearchPresenter: SearchPresenterInputProtocol {
    func performSearch(with query: String) {
        Task {
            await interactor.performSearch(with: query)
        }
    }
}

// MARK: - Output Protocol
extension SearchPresenter: SearchInteractorOutputProtocol {
  
}


