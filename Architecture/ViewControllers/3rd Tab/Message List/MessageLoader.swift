//
//  MessageLoader.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
import UIKit

class MessageLoader: NSObject, UITableViewDataSource {
    
    var messages: [Message] = []
    
    // TODO Get rid of this
    init(networkManager: NetworkManager) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() // TODO: dequeue cells
        cell.textLabel?.text = messages[indexPath.row].text
        return cell
    }
}
