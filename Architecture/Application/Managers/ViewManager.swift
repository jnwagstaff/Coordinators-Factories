//
//  ViewManager.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit

protocol ViewManagerProtocol {
    func start()
}

/*
 View Hierarchy
 Listens for view related events e.g. login, logout, etc
 Takes view logic from AppCoordinator
 Contained in Dependency Manager
*/
class ViewManager: NSObject {
    // MARK: - Properties
    var window: UIWindow?
    
    typealias Factory = ViewManagerFactoryProtocol & StoryboardManagerProtocol & ViewControllerFactoryProtocol
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
}

extension ViewManager: ViewManagerProtocol {
    func start() {
        setupMainApp()
    }
}

// MARK: - Main Setup

extension ViewManager {
    private func setupMainApp() {
        setRootViewController(factory.getTabBarController())
    }
}

// MARK: - Helper Functions

extension ViewManager {
    private func setRootViewController(_ vc: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
}

// MARK: Events Observed

extension ViewManager {
    @objc private func notificationReceived(info: Notification) {
        
    }
}

// MARK: Tab Bar Crap

extension ViewManager {
    
}
