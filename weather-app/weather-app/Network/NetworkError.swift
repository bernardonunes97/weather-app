//
//  NetworkError.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation

enum NetworkError: Error {
    case deviceOffline
    case unknownError
    case invalidURL
    case APIError
    case decodeFailure
    case emptyData
}
