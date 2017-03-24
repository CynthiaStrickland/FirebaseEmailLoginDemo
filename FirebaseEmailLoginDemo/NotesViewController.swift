//
//  NotesViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/16/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import FirebaseAuth

class NotesViewController: UIViewController {

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var saveNotes: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
    }
    
    @IBAction func saveNotesButtonPressed(_ sender: Any) {
        
        
    }
    
    func customButtons() {
        saveNotes.layer.borderColor = buttonBorder
        saveNotes.layer.backgroundColor  = buttonColor
        saveNotes.layer.borderWidth = 1
        saveNotes.layer.cornerRadius = 10
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.notes.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
