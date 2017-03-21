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
    
    let loginButton = UIButton()
    var loginButtonConstraints:[NSLayoutConstraint] = []
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
//    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginRegisterControl: UISegmentedControl!
    
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "forgotPassword", sender: self)

    }
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customButtons()
        
        if FIRAuth.auth()?.currentUser != nil {
            self.performSegue(withIdentifier: "tab", sender: self)
        }
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if emailTextField != nil && passwordTextField != nil {
            
            if loginRegisterControl.selectedSegmentIndex == 0 {
                FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    
                    if user != nil {
                        self.performSegue(withIdentifier: "tab", sender: self)
                        
                    } else {
                        if let myError = error?.localizedDescription {
                            print(myError)
                        } else {
                            let alert = UIAlertController(title: "Error", message: "Please enter a valid email address and/or password", preferredStyle: .actionSheet)
                            self.present(alert, animated: true, completion:nil)
                            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                                // perhaps use action.title here
                            })
                        }
                    }
                })
            } else {
                FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    if user != nil {
                        self.performSegue(withIdentifier: "tab", sender: self)
                    } else {
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
    
    func customButtons() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.frame = CGRect(x: 127, y: 364, width: 114, height: 40)
        loginButton.layer.backgroundColor = buttonColor
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Calibri", size: 12)
        loginButton.layer.borderColor = buttonBorder
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 10
        
        let topConstraint = loginButton.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomConstraint = loginButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftConstraint = loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightConstraint = loginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        
        loginButtonConstraints = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]
        NSLayoutConstraint.activate(loginButtonConstraints)
        
        self.view.addSubview(loginButton)

        
        loginRegisterControl.layer.borderColor = buttonBorder
        loginRegisterControl.layer.backgroundColor  = buttonColor
        loginRegisterControl.layer.borderWidth = 1
        loginRegisterControl.layer.cornerRadius = 10
        
        forgotPassword.layer.borderColor = buttonBorder
        forgotPassword.layer.backgroundColor  = buttonColor
        forgotPassword.layer.borderWidth = 1
        forgotPassword.layer.cornerRadius = 10
    }
}

