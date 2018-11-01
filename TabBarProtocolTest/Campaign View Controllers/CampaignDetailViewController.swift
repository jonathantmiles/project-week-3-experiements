//
//  CampaignDetailViewController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class CampaignDetailViewController: UIViewController, ChooseCampaignDelegate {
    var currentcampaign: Campaign?
    
    var campaign: Campaign?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        title = campaign == nil ? "New Campaign" : campaign?.name
    }

    @IBAction func chooseCampaign(_ sender: Any) {
        guard let campaign = campaign else { return }
//        currentcampaign = campaign
        CampaignController.shared.setCurrentCampaign(campaign: campaign)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? CampaignsTableViewController else { return }
        destVC.currentcampaign = self.currentcampaign
    }

}
