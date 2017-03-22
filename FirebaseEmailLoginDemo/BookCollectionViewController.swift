//
//  BookCollectionViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/17/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import FirebaseAuth

class BookViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let bookData = BookData.loadBooks()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logout(_ sender: UIButton) {
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)

    }
    
}
