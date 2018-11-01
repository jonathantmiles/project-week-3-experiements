//
//  DisplaySelectedCampaignViewController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class DisplaySelectedCampaignViewController: UIViewController, ChooseCampaignDelegate {
    var currentcampaign: Campaign?
    
    let campaignController = CampaignController.shared

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        guard let campaign = campaignController.currentCampaign else { return }
        campaignLabel.text = campaign.name
    }
    
    @IBOutlet weak var campaignLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
