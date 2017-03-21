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
    
    @IBOutlet weak var logout: UIButton!
    
    @IBAction func logout(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()    ///Should implement do catch
        performSegue(withIdentifier: "logout", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
