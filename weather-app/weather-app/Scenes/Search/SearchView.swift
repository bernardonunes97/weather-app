//
//  SearchView.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import SwiftUI

struct SearchView: View {
    // MARK: - Properties
    @State private var searchQuery: String = ""
    @State private var showWeatherView = false
    @ObservedObject private var viewModel: SearchViewModel
    
    // MARK: - init
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    var body: some View {
        VStack {
            // Search Bar
            HStack {
                TextField("Search...", text: $searchQuery)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .onChange(of: searchQuery, perform: { query in
                        updateSuggestions(for: query)
                    })
            }
            .padding(.top)

            // Suggestions List
            if !viewModel.cities.isEmpty {
                List(viewModel.cities, id: \.self) { suggestion in
                    HStack {
                        Text(suggestion.nameToPresent)
                            .onTapGesture {
                                selectSuggestion(suggestion)
                            }
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    
                }
                .listStyle(PlainListStyle())
            } else {
                Spacer()
            }
        }
        .padding()
        .popover(isPresented: $showWeatherView) {
            if let selectedCity = viewModel.selectedCity {
                WeatherConfigurator().createModule(cityModel: selectedCity)
            }
        }
    }

    // MARK: - Methods
    /// Update suggestions based on the current query
    /// - Parameter query: query representing city to be searched
    private func updateSuggestions(for query: String) {
        if query.isEmpty {
            viewModel.clearCities()
        } else {
            performSearch()
        }
    }

    /// Perform the search when the button is pressed
    private func performSearch() {
        viewModel.performSearch(with: searchQuery)
    }

    /// Select a suggestion from the list
    /// - Parameter suggestion: suggestion that was selected by user
    private func selectSuggestion(_ suggestion: CityModel) {
        viewModel.selectedCity = suggestion
        showWeatherView.toggle()
        viewModel.clearCities()
        searchQuery = ""
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchConfigurator().createModule()
    }
}

