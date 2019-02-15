//
//  MessageDetailViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController {
    private var message: Message
    
    //    typealias Factory = ViewControllerFactory
    //    private let factory: Factory
    
    init(message: Message) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class MessageSender: NSObject {
    init(networkManager: NetworkManager) {
        
    }
}
