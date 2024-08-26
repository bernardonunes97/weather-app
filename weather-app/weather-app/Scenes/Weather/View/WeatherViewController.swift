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
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
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
        startLoading()
        presenter.fetchWeatherInfo()
        setupView()
    }

    // MARK: - Actions
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func refreshButtonTapped() {
        startLoading()
        presenter.fetchWeatherInfo()
    }

    @objc private func unitToggleButtonTapped() {
        // Handle unit toggle action
        print("Unit toggle button tapped")
    }
    
    private func startLoading() {
        weatherView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    private func stopLoading() {
        weatherView.isHidden = false
        activityIndicator.stopAnimating()
    }
}

// MARK: - WeatherPresenterOutputProtocol
extension WeatherViewController: WeatherPresenterOutputProtocol {
    func showError(with text: String) {
        stopLoading()
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in 
            alert.dismiss(animated: true)
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func setIcon(with image: UIImage?) {
        weatherView.setIcon(with: image)
    }
    
    func setWeatherInfo(description: String, temperature: String) {
        stopLoading()
        weatherView.setWeatherInfo(description: description, temperature: temperature)
    }
}

// MARK: - ViewCode
extension WeatherViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(activityIndicator)
        view.addSubview(weatherView)
    }
    
    func setupConstraints() {
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .gray
    }
}
