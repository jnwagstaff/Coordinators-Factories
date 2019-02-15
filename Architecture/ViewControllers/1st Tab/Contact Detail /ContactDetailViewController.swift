//
//  ContactDetailViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    typealias Factory = ViewControllerFactoryProtocol
    
    var factory: Factory
    var contact: Contact
    
    // MARK: - View
    let baseView = ContactDetailView()
    
    init(factory: Factory, contact: Contact) {
        self.factory = factory
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.contactLabel.text = contact.fullName
    }
}
