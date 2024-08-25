//
//  NetworkManagerProtocol.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func getRequest<T:Decodable>(
        entity: T.Type,
        path: String,
        queryItemsDict: [String: String]
    ) async throws -> T
}
