//
//  MessagesFlowFactory.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit


protocol MessageBoundFactoryProtocol {
    func makeMessageBoundFactory(for message: Message) -> MessageBoundFactory
}

protocol MessageLoaderFactory {
    func makeMessageLoader() -> MessageLoader
}


