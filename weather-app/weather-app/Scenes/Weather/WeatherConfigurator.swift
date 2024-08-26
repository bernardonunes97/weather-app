//
//  WeatherConfigurator.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import UIKit

final class WeatherConfigurator {
    
    func createModule(cityModel: CityModel) -> UIKitViewControllerWrapper {
        let netoworkManager = NetworkManager()
        let interactor = WeatherInteractor(networkManager: netoworkManager)
        let presenter = WeatherPresenter(interactor: interactor, cityModel: cityModel)
        interactor.output = presenter
        let viewController = WeatherViewController(presenter: presenter)
        presenter.viewController = viewController
        let navigation = UINavigationController(rootViewController: viewController)
        let viewControllerWrapper = UIKitViewControllerWrapper(viewController: navigation)
        
        return viewControllerWrapper
    }
}
