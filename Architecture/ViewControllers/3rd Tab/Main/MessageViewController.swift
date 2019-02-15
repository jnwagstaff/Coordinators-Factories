//
//  MessageViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    private var message: Message
    private var sender: MessageSender
    init(message: Message, sender: MessageSender) {
        self.message = message
        self.sender = sender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
