//
//  NotesTableViewController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CampaignController.shared.currentCampaign?.notes.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)

        guard let note = CampaignController.shared.currentCampaign?.notes[indexPath.row] else { return cell }
        
        cell.textLabel?.text = note.name
        cell.detailTextLabel?.text = note.noteType.rawValue

        return cell
    }


    private func updateViews() {
        tableView.reloadData()
        title = CampaignController.shared.currentCampaign?.name
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? NotesDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else { return }

        destVC.note = CampaignController.shared.currentCampaign?.notes[indexPath.row]
    }

}
