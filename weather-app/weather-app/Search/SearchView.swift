//
//  SearchView.swift
//  weather-app
//
//  Created by Bernardo Nunes on 22/08/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchQuery: String = ""
    @State private var suggestions: [String] = []
    private let presenter: SearchPresenterInputProtocol
    
    init(presenter: SearchPresenterInputProtocol) {
        self.presenter = presenter
    }

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
                
                // Search Button
                Button(action: {
                    performSearch()
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding(.top)

            // Suggestions List
            if !suggestions.isEmpty {
                List(suggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .onTapGesture {
                            selectSuggestion(suggestion)
                        }
                }
                .listStyle(PlainListStyle())
            } else {
                Spacer()
            }
        }
        .padding()
    }

    /// Update suggestions based on the current query
    /// - Parameter query: query representing city to be searched
    private func updateSuggestions(for query: String) {
        
    }

    /// Perform the search when the button is pressed
    private func performSearch() {
        presenter.performSearch(with: searchQuery)
    }

    /// Select a suggestion from the list
    /// - Parameter suggestion: suggestion that was selected by user
    private func selectSuggestion(_ suggestion: String) {
        searchQuery = suggestion
        suggestions.removeAll() // Clear suggestions after selection
        performSearch()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchConfigurator().createModule()
    }
}

