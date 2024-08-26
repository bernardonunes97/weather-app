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
        setupView()
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - WeatherPresenterOutputProtocol
extension WeatherViewController: WeatherPresenterOutputProtocol {
    
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
    }
}
