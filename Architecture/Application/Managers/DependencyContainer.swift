//
//  DependencyContainer.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit

/// Contains all dependencies for the application (Singletons now have a place to live) 
class DependencyContainer {
    private lazy var messageSender = MessageSender(networkManager: networkManager)
    private lazy var networkManager = NetworkManager()
    private lazy var viewManager =  ViewManager(factory: self)
    private lazy var storyboardManager = StoryboardManager(factory: self)
    
    private lazy var tabBarController = TabBarController()
    private lazy var firstCoordinator = FirstTabCoordinator(factory: self)
    private lazy var secondCoordinator = SecondTabCoordinator(factory: self)
    private lazy var thirdCoordinator = ThirdTabCoordinator(factory: self)
}

// MARK: - Manager Protocols

protocol StoryboardManagerProtocol {
    func getStoryboardManager() -> StoryboardManager
}

protocol ViewManagerFactoryProtocol {
    func getViewManager() -> ViewManager
}

protocol NetworkBoundFactoryProtocol {
    func makeNetworkManager() -> NetworkManager
}

// MARK: - Manager Protocol Implementations

extension DependencyContainer: ViewManagerFactoryProtocol {
    func getViewManager() -> ViewManager {
        return viewManager
    }
}

extension DependencyContainer: StoryboardManagerProtocol {
    func getStoryboardManager() -> StoryboardManager {
        return storyboardManager
    }
}


// MARK: - View Controller Protocol

protocol ViewControllerFactoryProtocol {
    /// Main ViewControllers
    func getTabBarController() -> TabBarController
    func getFirstMainViewController() -> UINavigationController
    func getSecondMainViewController() -> UINavigationController
    func getThirdMainViewController() -> UINavigationController
    
    // Local Model Example (First Tab)
    func makeContactDetailViewController(with contact: Contact) -> ContactDetailViewController
    
    // Messages Example Section (Third Tab) 
    func makeMessageListViewController(with messages: [Message]) -> MessageListViewController
    func makeMessageViewController(for message: Message) -> MessageDetailViewController
}

extension DependencyContainer: ViewControllerFactoryProtocol {
    
    func getTabBarController() -> TabBarController {
        tabBarController.viewControllers = [getFirstMainViewController(), getSecondMainViewController(), getThirdMainViewController()]
        return tabBarController
    }
    
    func getFirstMainViewController() -> UINavigationController {
        let vc = FirstMainViewController(factory: self)
        vc.delegate = firstCoordinator
        vc.title = "Local Model"
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = "First"
        firstCoordinator.navController = navController
        return navController
    }
    
    func getSecondMainViewController() -> UINavigationController {
        let vc = SecondMainViewController()
        vc.delegate = secondCoordinator
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = "Second"
        secondCoordinator.navController = navController
        return navController
    }
    
    func getThirdMainViewController() -> UINavigationController {
        let vc = ThirdMainViewController(factory: self)
        vc.delegate = thirdCoordinator
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.title = "Third"
        thirdCoordinator.navController = navController
        return navController
    }
    
    // First Tab Flow
    func makeContactDetailViewController(with contact: Contact) -> ContactDetailViewController {
        return ContactDetailViewController(factory: self, contact: contact)
    }
    
    // Second Tab Flow 
    
    // Third Tab Flow
    func makeMessageListViewController(with messages: [Message]) -> MessageListViewController {
        return MessageListViewController(factory: self, messages: messages)
    }

    func makeMessageViewController(for message: Message) -> MessageDetailViewController {
        return MessageDetailViewController(message: message)
    }
}

extension DependencyContainer: MessageLoaderFactory {
    func makeMessageLoader() -> MessageLoader {
        return MessageLoader(networkManager: networkManager)
    }
}

extension DependencyContainer: MessageBoundFactoryProtocol {
    func makeMessageBoundFactory(for message: Message) -> MessageBoundFactory {
        return MessageBoundFactory(message: message, rootFactory: self)
    }
}

extension DependencyContainer: NetworkBoundFactoryProtocol {
    func makeNetworkManager() -> NetworkManager {
        return networkManager
    }
}


class NetworkManager: NSObject {
    func fetchMessages(handler: ([Message])->()) {
        let messages = [Message(with: "ONE"), Message(with: "TWO"), Message(with: "THREE"), Message(with: "4"), Message(with: "5"), Message(with: "6")]
        handler(messages)
    }
}
