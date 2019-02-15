//
//  SecondMainViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

protocol SecondMainViewControllerDelegate: class {
    func didSelectModel()
}

/// Logic Controller

class SecondMainViewController: UIViewController {
    
    weak var delegate: SecondMainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
