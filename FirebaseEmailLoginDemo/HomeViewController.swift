//
//  HomeViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/22/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileName: UITextField!
    @IBOutlet weak var authorOfBook: UITextField!
    @IBOutlet weak var titleOfBook: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var bookCoverImage: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var imagePicked = 0
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customButtons()
    }
    
    //MARK:  IMAGEPICKER
    
    @IBAction func bookCoverImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func addImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        bookCoverImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
//        
//        if imagePicked == 1 {
//            profileImage.image = pickedImage
//        } else if imagePicked == 0 {
//            addBookReadImageView.image = pickedImage
//        }
//        
        if let selectedImage = pickedImage {
            bookCoverImage.image = selectedImage
            
            //  ******* Circular Image *******
//            self.bookCoverImage.layer.cornerRadius = self.bookCoverImage.frame.width / 2.0
//            self.bookCoverImage.clipsToBounds = true
//            
//            //  ******* BORDER COLOR ********
//            self.bookCoverImage.layer.borderWidth = 2.0
//            self.bookCoverImage.layer.borderColor = UIColor.white.cgColor
            
            self.dismiss(animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.titleOfBook.resignFirstResponder()
        self.authorOfBook.resignFirstResponder()
        return true
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK:  CUSTOM BUTTONS
    
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
