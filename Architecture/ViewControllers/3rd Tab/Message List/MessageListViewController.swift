//
//  MessagesListViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

/// Class with multiple dependencies only needs to take in one factory
class MessageListViewController: UIViewController {
    
    typealias Factory = MessageLoaderFactory & ViewControllerFactoryProtocol & NetworkBoundFactoryProtocol
    private let factory: Factory
    
    private lazy var networkManager = factory.makeNetworkManager()
    private lazy var loader = factory.makeMessageLoader() // makes loader with it's dependencies that we don't know it has or needs
    
    var baseView = MessageListView()
    
    override func loadView() {
        super.loadView()
        view = baseView
        baseView.table.dataSource = loader
        baseView.table.delegate = self
    }
    
    init(factory: Factory, messages: [Message]) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
        self.loader.messages = messages
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MessageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
