//
//  NotesDetailViewController.swift
//  TabBarProtocolTest
//
//  Created by Jonathan T. Miles on 10/31/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        title = note?.name ?? "Add New Note"
        if let note = note {
            noteNameTextField.text = note.name
            noteDetailsTextField.text = note.details
            let noteType = note.noteType
            pageTypeSegmentedControl.selectedSegmentIndex = Note.NoteType.allNoteTypes.firstIndex(of: noteType)!
        }
    }
    
    @IBAction func saveNote(_ sender: Any) {
        guard let name = noteNameTextField.text,
            let details = noteDetailsTextField.text,
            let currentCampaign = CampaignController.shared.currentCampaign,
            let index = CampaignController.shared.campaigns.firstIndex(of: currentCampaign)
            else { return }
        let segIndex = pageTypeSegmentedControl.selectedSegmentIndex
        let noteType = Note.NoteType.allNoteTypes[segIndex]
        CampaignController.shared.addNote(toCampaign: &CampaignController.shared.campaigns[index], withName: name, details: details, noteType: noteType)
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var noteNameTextField: UITextField!
    @IBOutlet weak var noteDetailsTextField: UITextView!
    @IBOutlet weak var pageTypeSegmentedControl: UISegmentedControl!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
