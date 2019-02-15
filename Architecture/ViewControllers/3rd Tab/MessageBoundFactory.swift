//
//  MessageBoundFactory.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit

class MessageBoundFactory {
    private let message: Message
    typealias Factory = MessageBoundFactoryProtocol
    
    private let rootFactory: Factory
    
    init(message: Message, rootFactory: Factory) {
        self.message = message
        self.rootFactory = rootFactory
    }
    
    func makeMessageDetailViewController() -> UIViewController {
        return MessageDetailViewController(message: message)
    }
}
