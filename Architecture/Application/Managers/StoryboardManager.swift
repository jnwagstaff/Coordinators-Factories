//
//  StoryboardManager.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit


// TODO: Show example of how Factories work with Storyboards
class StoryboardManager {
    
    enum Storyboards: String {
        case main = "Main"
        case firstTab = "FirstTab"
        case secondTab = "SecondTab"
        case thirdTab = "ThirdTab"
    }
    
    enum ViewControllers {
        enum firstTab: String {
            case main = "FirstMainViewController"
        }
        
        enum secondTab: String {
            case main = "SecondMainViewController"
        }
        
        enum thirdTab: String {
            case main = "ThirdMainViewController"
        }
    }
    
    // MARK: Factory Dependencies 
    typealias Factory = StoryboardManagerProtocol & NetworkBoundFactoryProtocol & ViewControllerFactoryProtocol
    
    private var factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
    typealias StoryboardIdentifier = Storyboards
    
    private func loadScene<ViewControllerIdentifier: RawRepresentable>(storyboard: StoryboardIdentifier, viewController: ViewControllerIdentifier) -> UIViewController where ViewControllerIdentifier.RawValue == String {
        return UIStoryboard.init(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: viewController.rawValue)
    }
    
    func defaultNavController(rootVC: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.navigationBar.isOpaque = true
        navController.navigationBar.isTranslucent = false
        navController.view.backgroundColor = .white
        navController.extendedLayoutIncludesOpaqueBars = true
        return navController
    }
    
}

// MARK: - First Tab

extension StoryboardManager {
    func firstTabMain<T: FirstMainViewControllerDelegate>(with coordinator: T) -> UIViewController {
        let vc = loadScene(storyboard: Storyboards.firstTab, viewController: ViewControllers.firstTab.main) as! FirstMainViewController
        vc.delegate = coordinator
        vc.title = "FirstMainViewController"
        
        let nav = defaultNavController(rootVC: vc)
        nav.tabBarItem.title = "First"
        
        return nav
    }
}

// MARK: - Second Tab

extension StoryboardManager {
    func secondTabMain<T: SecondMainViewControllerDelegate>(with coordinator: T) -> SecondMainViewController {
        let vc = SecondMainViewController()
        vc.delegate = coordinator
        vc.tabBarItem.title = "Second"
        return vc
    }
}

// MARK: - Third Tab

extension StoryboardManager {
    func thirdTabMain() -> ThirdMainViewController {
        let vc = loadScene(storyboard: Storyboards.thirdTab, viewController: ViewControllers.thirdTab.main) as! ThirdMainViewController
        // if loading from a storyboard, must have a setFactory method
//        vc.setFactory(factory: factory)
        return ThirdMainViewController(factory: factory)
    }
}
