//
//  SearchProtocols.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

// MARK: - Presenter
protocol SearchPresenterInputProtocol: AnyObject {
    func performSearch(with query: String)
}

// MARK: - Interactor
protocol SearchInteractorInputProtocol: AnyObject {
    func performSearch(with query: String)
}

protocol SearchInteractorOutputProtocol: AnyObject {
   
}
