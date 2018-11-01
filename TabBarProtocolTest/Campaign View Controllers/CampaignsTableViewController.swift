//
//  CampaignsTableViewController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class CampaignsTableViewController: UITableViewController, ChooseCampaignDelegate {
    var currentcampaign: Campaign?
    // let campaignController = CampaignController.shared

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CampaignController.shared.campaigns.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CampaignCell", for: indexPath)
        
        let campaign = CampaignController.shared.campaigns[indexPath.row]
        
        cell.textLabel?.text = campaign.name
        cell.detailTextLabel?.text = campaign.details

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? CampaignDetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        destVC.campaign = CampaignController.shared.campaigns[indexPath.row]
    }

}
