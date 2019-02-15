//
//  User.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation

struct Message: Codable {
    var text: String
    
    init(with text: String) {
        self.text = text
    }
}
