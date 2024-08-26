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
    private let weatherView = WeatherView()
    
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
        presenter.fetchWeatherInfo()
        setupView()
    }

    // MARK: - Actions
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func refreshButtonTapped() {
        presenter.fetchWeatherInfo()
    }

    @objc private func unitToggleButtonTapped() {
        // Handle unit toggle action
        print("Unit toggle button tapped")
    }
}

// MARK: - WeatherPresenterOutputProtocol
extension WeatherViewController: WeatherPresenterOutputProtocol {
    func setWeatherInfo(description: String, temperature: String) {
        weatherView.setWeatherInfo(description: description, temperature: temperature)
    }
}

// MARK: - ViewCode
extension WeatherViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(weatherView)
    }
    
    func setupConstraints() {
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
    
    func setupAdditionalConfiguration() {
        weatherView.setCityName(name: presenter.cityName)
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Close",
            style: .done,
            target: self,
            action: #selector(closeButtonTapped)
        )
        weatherView.refreshButton.addTarget(
            self,
            action: #selector(refreshButtonTapped),
            for: .touchUpInside
        )
        weatherView.unitToggleButton.addTarget(
            self,
            action: #selector(unitToggleButtonTapped),
            for: .touchUpInside
        )
    }
}
