//
//  NetworkManager.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

final class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Private Properties
    private let baseURL = "http://api.openweathermap.org/"
    private let baseURLIcon = "https://openweathermap.org/"
    private let apiKeyQueryItem = URLQueryItem(name: "appid", value: "27ae6f3d31823d0eba121e25256941c0")
    private let iconServicePath = "img/wn/"
    private let imageScale = "@2x.png"
    
    // MARK: - Methods
    /// Method to make get request on API
    /// - Parameters:
    ///   - entity: Entity type with model of data that should be returned from API
    ///   - path: path to determine which service should be triggered
    /// - Returns: returns the decoded data or throws an error
    func getRequest<T:Decodable>(
        entity: T.Type,
        path: String,
        queryItemsDict: [String: String]
    ) async throws -> T {
        
        // Create request
        guard let url = makeURL(service: path, queryItemsDict: queryItemsDict) else {
            throw NetworkError.invalidURL
        }
        let request = URLRequest(url: url)
        
        // Perform the request
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            var networkError: NetworkError = .unknownError
            if error.localizedDescription.uppercased().contains("OFFLINE") {
                networkError = .deviceOffline
            }
            throw networkError
        }
        guard
            let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode)
        else {
            throw NetworkError.APIError
        }
        
        // Decode the response body to the expected type
        let decodedData: T
        do {
            decodedData = try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodeFailure
        }
        
        return decodedData
    }
    
    /// Method to retrieve the image icon with its code
    /// - Parameter iconCode: Icon Code
    /// - Returns: returns data of the icon
    func getIconRequest(iconCode: String) async throws -> Data {
        let path = iconServicePath + iconCode + imageScale
        
        // Create request
        guard let url = URL(string: baseURLIcon + path) else {
            throw NetworkError.invalidURL
        }
        let request = URLRequest(url: url)
        
        // Perform the request
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            var networkError: NetworkError = .unknownError
            if error.localizedDescription.uppercased().contains("OFFLINE") {
                networkError = .deviceOffline
            }
            throw networkError
        }
        guard
            let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode)
        else {
            throw NetworkError.APIError
        }
        
        return data
    }
    
    /// Method to build URL
    /// - Parameter service: String describing service to be called
    /// - Parameter queryItemsDict: Query Items to be added to the URL
    /// - Returns: URL with every component
    private func makeURL(service: String, queryItemsDict: [String: String]) -> URL? {
        let fullURL = baseURL + service
        var urlComponents = URLComponents(string: fullURL)
        var urlQueryItems = queryItemsDict.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        urlQueryItems.append(apiKeyQueryItem)
        urlComponents?.queryItems = urlQueryItems

        return urlComponents?.url
    }
}
