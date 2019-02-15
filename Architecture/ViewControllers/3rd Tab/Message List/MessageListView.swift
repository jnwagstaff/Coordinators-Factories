//
//  MessageListView.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

class MessageListView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Subviews
    var table: UITableView!
    
    // MARK: - Stored Constraints
    // (Store any constraints that might need to be changed or animated later)
    
    
    // MARK: - Initialization
    
    convenience init() {
        self.init(frame: .zero)
        configureSubviews()
        configureTesting()
        configureLayout()
    }
    
    /// Set view/subviews appearances
    fileprivate func configureSubviews() {
        table = UITableView(frame: .zero, style: .plain)
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "MessageListView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(table)
        table.fillSuperview()
    }
}

