//
//  Campaign.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct Campaign: Equatable {
    var name: String
    var details: String
    
    var notes: [Note]
}
