//
//  ViewCode.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation

protocol ViewCode: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func setupAdditionalConfiguration() {}
}
