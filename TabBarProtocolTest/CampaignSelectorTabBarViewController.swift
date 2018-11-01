//
//  CampaignSelectorTabBarViewController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

protocol ChooseCampaignDelegate: class {
    var currentcampaign: Campaign? { get set }
//    func setCurrentCampaign()
//    var delegate: ChooseCampaignDelegate? { get set }
}

class CampaignSelectorTabBarViewController: UITabBarController, ChooseCampaignDelegate {
    
    var currentcampaign: Campaign?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
