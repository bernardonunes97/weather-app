//
//  UIKitViewControllerWrapper.swift
//  weather-app
//
//  Created by Bernardo Nunes on 26/08/24.
//

import Foundation
import UIKit
import SwiftUI

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No updates needed for now
    }
}
