//
//  NetworkManagerProtocolSpy.swift
//  weather-appTests
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
@testable import weather_app

typealias NetworkManagerProtocolDummy = NetworkManagerProtocolSpy

final class NetworkManagerProtocolSpy: NetworkManagerProtocol {
    
    enum Methods: Equatable {
        case requestDecode(path: String)
        case request(path: String)
    }

    /// An array with all called methods and accessed properties of the Spy.
    private(set) var calledMethods = [Methods]()
    
    var errorToThrow: NetworkError?
    var jsonToBeReturned = "{}".data(using: .utf8)!
    
    func getRequest<T>(entity: T.Type, path: String, queryItemsDict: [String : String]) async throws -> T where T : Decodable {
        if let errorToThrow {
            throw errorToThrow
        }
        let jsonData: T? = try decode(data: jsonToBeReturned)
        return jsonData!
    }
   
    var dataToBeReturned = Data()
    func getIconRequest(iconCode: String) async throws -> Data {
        if let errorToThrow {
            throw errorToThrow
        }
        
        return dataToBeReturned
    }
    
    private func decode<T: Decodable>(data: Data) throws -> T? {
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
}
