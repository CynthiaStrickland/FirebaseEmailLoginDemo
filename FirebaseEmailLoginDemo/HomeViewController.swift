//
//  HomeViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/22/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var authorOfBook: UITextField!
    @IBOutlet weak var titleOfBook: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customButtons()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.titleOfBook.resignFirstResponder()
        self.authorOfBook.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func customButtons() {
        logoutButton.layer.borderColor = buttonBorder
        logoutButton.layer.backgroundColor  = buttonColor
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.cornerRadius = 10
        
        saveButton.layer.borderColor = buttonBorder
        saveButton.layer.backgroundColor  = buttonColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
