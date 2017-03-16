//
//  LoginViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/15/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginRegisterControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if emailTextField != nil && passwordTextField != nil {
            
            if loginRegisterControl.selectedSegmentIndex == 0 {
                FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    
                    if user != nil {
                        //sign in successful
                        
                    } else {
                        if let myError = error?.localizedDescription {
                            print(myError)
                        } else {
                            let alert = UIAlertController(title: "Error", message: "Please enter a valid email address and/or password", preferredStyle: .actionSheet)
                            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                                // perhaps use action.title here
                            })
                        }
                    }
                })
            } else {
                FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    if user != nil {
                        //successfully signed up
                    } else {
                        //Display erro
                    }
                })
            }
        }
    
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

