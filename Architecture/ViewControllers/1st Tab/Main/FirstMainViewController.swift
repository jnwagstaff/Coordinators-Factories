//
//  FirstMainViewController.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

protocol FirstMainViewControllerDelegate: class {
    func didSelectModel(model: Contact)
}

/// Example of local model being passed with the coordinator
class FirstMainViewController: UIViewController {
    typealias Factory = ViewControllerFactoryProtocol
    
    let factory: Factory
    var baseView = FirstMainView()
    
    weak var delegate: FirstMainViewControllerDelegate?
    
    var contacts = [Contact(firstName: "Jake", lastName: "Wagstaff"),
                    Contact(firstName: "Josh", lastName: "Jones"),
                    Contact(firstName: "Paul", lastName: "Rudd")]
    
    init(factory: Factory) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.table.delegate = self
        baseView.table.dataSource = self
    }
    
}


extension FirstMainViewController: UITableViewDelegate, UITableViewDataSource {
    // Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        cell.configure(with: contacts[indexPath.row])
        return cell
    }
    
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectModel(model: contacts[indexPath.row])
    }
    
}
