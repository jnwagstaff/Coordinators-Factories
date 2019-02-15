//
//  ContactDetailView.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import UIKit

class ContactDetailView: UIView {
    
    // MARK: - Properties
    
    // MARK: - Subviews
    var contactLabel = UILabel()
    
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
        backgroundColor = .white
        
        contactLabel.textAlignment = .center
        contactLabel.font = UIFont.systemFont(ofSize: 30)
        contactLabel.textColor = .black 
    }
    
    /// Set AccessibilityIdentifiers for view/subviews
    fileprivate func configureTesting() {
        accessibilityIdentifier = "ContactDetailView"
    }
    
    /// Add subviews, set layoutMargins, initialize stored constraints, set layout priorities, activate constraints
    fileprivate func configureLayout() {
        addAutoLayoutSubview(contactLabel)
        
        // Activate NSLayoutAnchors within this closure
        NSLayoutConstraint.activate([
            contactLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            contactLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
}

