//
//  WeatherViewController.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import UIKit

final class WeatherViewController: UIViewController {
    
    // MARK: - Viper Properties
    private let presenter: WeatherPresenterInputProtocol
    
    // MARK: - Inits
    init(presenter: WeatherPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set background color
        view.backgroundColor = .systemBackground

        // Initialize the WeatherView
        let weatherView = WeatherView()

        // Add to the view controller's view
        view.addSubview(weatherView)

        // Set constraints
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Add close button to navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .done,
            target: self,
            action: #selector(closeButtonTapped)
        )
    }

    @objc private func closeButtonTapped() {
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
}

extension WeatherViewController: WeatherPresenterOutputProtocol {
    
}
