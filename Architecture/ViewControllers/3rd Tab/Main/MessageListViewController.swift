//
//  MessagesListViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController {
    
    typealias Factory = MessageLoaderFactory & ViewControllerFactoryProtocol
    private let factory: Factory
    
    private lazy var loader = factory.makeMessageLoader()
    
    init(factory: Factory, messages: [Message]) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
