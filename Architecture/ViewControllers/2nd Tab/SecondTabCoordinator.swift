//
//  SecondTabCoordinator.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit

class SecondTabCoordinator: NavCoordinator {
    
    // MARK: - Properties
    typealias Factory = ViewControllerFactoryProtocol
    var factory: Factory
    
    var navController: UINavigationController?
    
    init(factory: Factory) {
        self.factory = factory
        super.init()
    }
    
    // MARK: - Navigation
    
    /// Present a VC modally
    private func present(vc: UIViewController) {
        navController?.present(vc, animated: true, completion: nil)
    }
    
    /// Adding a view controller to the stack
    private func push(vc: UIViewController) {
        navController?.pushViewController(vc, animated: true)
    }
    
    func stackViewControllers(vcs: [UIViewController]) {
        navController?.setViewControllers(vcs, animated: true)
    }
}

extension SecondTabCoordinator: SecondMainViewControllerDelegate {
    func didSelectModel() {
        
    }
}
