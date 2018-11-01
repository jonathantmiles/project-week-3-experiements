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

//        if let scratchCampaign = currentCampaign,
//            let current = currentCampaign,
//            let index = campaigns.firstIndex(of: current) {
//
//            campaigns.remove(at: index)
//            campaigns.insert(scratchCampaign, at: index)
//
            //        saveCurrentCampaign()
            
            currentCampaign = campaign
        
    }
    
    func saveCurrentCampaign() {
        guard let currentCampaign = currentCampaign,
            let index = campaigns.firstIndex(of: currentCampaign) else { return }
        campaigns.remove(at: index)
        campaigns.insert(currentCampaign, at: index)
    }
    
    // MARK: - Notes management
    
    func addNote(toCampaign campaign: inout Campaign, withName name: String, details: String, finishSetting: Note.FinishSetting = .stub, noteType: Note.NoteType = .page) {
        let note = Note(name: name, details: details, finishSetting: finishSetting, noteType: noteType)
        campaign.notes.append(note)
        setCurrentCampaign(campaign: campaign)
    }
}
