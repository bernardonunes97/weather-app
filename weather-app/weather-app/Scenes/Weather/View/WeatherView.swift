//
//  WeatherView.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import UIKit

final class WeatherView: UIView {

    // MARK: - UI Elements
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.numberOfLines = 0
        
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        
        return label
    }()

    private let weatherDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        
        return label
    }()

    private let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        
        return imageView
    }()

    let refreshButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Refresh", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        return button
    }()

    let unitToggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("°C / °F", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    // MARK: - Properties
    private let defaultIcon = UIImage(systemName: "photo")
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setCityName(name: String) {
        cityLabel.text = name
    }
    
    func setWeatherDescription(description: String) {
        weatherDescriptionLabel.text = description
    }
    
    func setTemperature(temperature: String) {
        temperatureLabel.text = temperature
    }
    
    func setIcon(with image: UIImage?) {
        weatherIconImageView.image = image ?? defaultIcon
    }
}

// MARK: - ViewCode
extension WeatherView: ViewCode {
    func buildViewHierarchy() {
        [
            cityLabel,
            temperatureLabel,
            weatherIconImageView,
            weatherDescriptionLabel,
            refreshButton,
            unitToggleButton
        ].forEach {
            stackView.addArrangedSubview($0)
        }
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    func setupAdditionalConfiguration() {
        weatherIconImageView.image = defaultIcon
    }
}
