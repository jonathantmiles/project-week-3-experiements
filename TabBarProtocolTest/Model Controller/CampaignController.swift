//
//  CampaignController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

class CampaignController {
    
    init() {
        self.campaigns = [ Campaign(name: "BlankOpera", details: "comics planning", notes: []),
                           Campaign(name: "Seven Worlds of the Exile", details: "epochal fantasy", notes: []),
                           Campaign(name: "Aeoliad", details: "Space Opera", notes: []) ]
        currentCampaign = campaigns.first
    }
    
    var campaigns: [Campaign]
    
    // MARK: - Singleton and currentCampaign management
    
    static let shared = CampaignController()
    
    var currentCampaign: Campaign?
    
    public func setCurrentCampaign(campaign: Campaign) {
        currentCampaign = campaign
    }
    
    // MARK: - Notes management
    
    func addNote(toCampaign campaign: inout Campaign, withName name: String, details: String, finishSetting: Note.FinishSetting = .stub, noteType: Note.NoteType = .page) {
        let note = Note(name: name, details: details, finishSetting: finishSetting, noteType: noteType)
        campaign.notes.append(note)
        setCurrentCampaign(campaign: campaign)
    }
    
    func update(note: inout Note, inCampaign campaign: inout Campaign, withName name: String, details: String, finishSetting: Note.FinishSetting, noteType: Note.NoteType) {
        guard let index = campaign.notes.firstIndex(of: note) else { return }
        note.name = name
        note.details = details
        note.finishSetting = finishSetting
        note.noteType = noteType
        campaign.notes.remove(at: index)
        campaign.notes.insert(note, at: index)
        setCurrentCampaign(campaign: campaign)
    }
}
