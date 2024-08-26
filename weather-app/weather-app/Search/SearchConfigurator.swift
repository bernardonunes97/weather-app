//
//  SearchConfigurator.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import Foundation
import SwiftUI

final class SearchConfigurator {
    
    func createModule() -> some View {
        let netoworkManager = NetworkManager()
        let presenter = SearchViewModel(networkManager: netoworkManager)
        let view = SearchView(presenter: presenter)
        
        return view
    }
}
