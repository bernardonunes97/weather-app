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
    
    var errorMessage: String {
        switch self {
        case .deviceOffline:
            return "Your device does not have internet connection."
        default:
            return "An unexpected error occured. Please try again later."
        }
    }
}
