//
//  ThirdMainViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit



protocol ThirdMainViewControllerDelegate: class {
    func didSelectModel()
}

class ThirdMainViewController: UIViewController {
    
    typealias Factory = ViewControllerFactoryProtocol & NetworkBoundFactoryProtocol
    private var factory: Factory?
    
    var baseView = ThirdMainView()
    
    weak var delegate: ThirdMainViewControllerDelegate?
    
    override func loadView() {
        super.loadView()
        view = baseView
        baseView.button.addTarget(self, action: #selector(refresh), for: .touchUpInside)
    }
    
    init(factory: Factory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func refresh() {
        self.factory?.makeNetworkManager().fetchMessages(handler: { (messages) in
            guard let factory = factory else { return }
            let messageListViewController = factory.makeMessageListViewController(with: messages)
            navigationController?.pushViewController(messageListViewController, animated: true)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
//        refresh()
    }
}
