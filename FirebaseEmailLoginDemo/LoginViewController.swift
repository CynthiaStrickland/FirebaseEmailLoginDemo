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
    var buttonConstraints:[NSLayoutConstraint] = []
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
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
        customLoginButton()
        
        if FIRAuth.auth()?.currentUser != nil {
            self.performSegue(withIdentifier: "tab", sender: self)
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
    
    func customLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.backgroundColor = buttonColor
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Calibri", size: 12)
        loginButton.layer.borderColor = buttonBorder
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 10
        
        self.view.addSubview(loginButton)
        
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        let loginButtonHeight = loginButton.heightAnchor.constraint(equalToConstant: 30)
        let loginButtonWidth = loginButton.widthAnchor.constraint(equalToConstant: 130)
        
        let xPlacement = loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let yPlacement = loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 60)
        
        buttonConstraints = [loginButtonHeight, loginButtonWidth, xPlacement, yPlacement]
        NSLayoutConstraint.activate(buttonConstraints)
        
        loginAction()
    }
    
    func loginAction() {
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
    
    func constraints() {
        let xPlacementLoginRegisterSegmentedControl = loginRegisterControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let yPlacementLoginRegisterSegmentedControl = loginRegisterControl.topAnchor.constraint(equalTo: self.view.topAnchor)
        
        
        
        buttonConstraints.append(xPlacementLoginRegisterSegmentedControl)
        buttonConstraints.append(yPlacementLoginRegisterSegmentedControl)
        
        NSLayoutConstraint.activate(buttonConstraints)
        

    }
    
    func customButtons() {
        
        loginRegisterControl.layer.borderColor = buttonBorder
        loginRegisterControl.layer.backgroundColor  = buttonColor
        
        forgotPassword.layer.borderColor = buttonBorder
        forgotPassword.layer.backgroundColor  = buttonColor
        forgotPassword.layer.borderWidth = 1
        forgotPassword.layer.cornerRadius = 10
        
        emailLabel.layer.borderColor = buttonBorder
        emailLabel.layer.backgroundColor  = buttonColor
        emailLabel.layer.borderWidth = 1
        emailLabel.layer.cornerRadius = 7
        
        passwordLabel.layer.borderColor = buttonBorder
        passwordLabel.layer.backgroundColor  = buttonColor
        passwordLabel.layer.borderWidth = 1
        passwordLabel.layer.cornerRadius = 7
    }
}

