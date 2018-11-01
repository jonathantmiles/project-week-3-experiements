//
//  Note.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct Note: Equatable {
    
    enum FinishSetting: String {
        case stub, short, draft, polished, finalized
    }
    
    enum NoteType: String {
        case character, item, faction, location, quest, page
    }
    
    var name: String
    var details: String
    var finishSetting: FinishSetting
    var noteType: NoteType
    
}
