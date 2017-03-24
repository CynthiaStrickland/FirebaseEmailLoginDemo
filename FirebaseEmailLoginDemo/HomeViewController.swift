//
//  HomeViewController.swift
//  FirebaseEmailLoginDemo
//
//  Created by Cynthia Strickland on 3/22/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import FirebaseAuth
import MobileCoreServices


class HomeViewController: UIViewController, UITextFieldDelegate {

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
    
class Camera {
        
        var delegate: (UINavigationControllerDelegate & UIImagePickerControllerDelegate)?
        
        init(delegate_: UINavigationControllerDelegate & UIImagePickerControllerDelegate) {
            delegate = delegate_
        }
        
        func presentPhotoLibrary(target: UIViewController, canEdit: Bool) {
            
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) && !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum) {
                
                return
            }
            
            let type = kUTTypeImage as String
            let imagePicker = UIImagePickerController()
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                
                imagePicker.sourceType = .photoLibrary
                
                if let availableTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) {
                    
                    if (availableTypes as NSArray).contains(type) {
                        
                        imagePicker.mediaTypes = [type]
                        imagePicker.allowsEditing = canEdit
                    }
                }
            } else if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
                
                imagePicker.sourceType = .savedPhotosAlbum
                
                if let availableTypes = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum) {
                    
                    if (availableTypes as NSArray).contains(type) {
                        
                        imagePicker.mediaTypes = [type]
                    }
                    
                }
            } else {
                
                return
            }
            
            imagePicker.allowsEditing = canEdit
            imagePicker.delegate = delegate
            target.present(imagePicker, animated: true, completion: nil)
        }
        
        func presentPhotoCamera(target: UIViewController, canEdit: Bool) {
            
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                
                return
            }
            
            let type1 = kUTTypeImage as String
            let imagePicker = UIImagePickerController()
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                if let availableTypes = UIImagePickerController.availableMediaTypes(for: .camera) {
                    
                    if (availableTypes as NSArray).contains(type1) {
                        
                        imagePicker.mediaTypes = [type1]
                        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                    }
                }
                
                if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                    
                    imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.rear
                    
                } else if UIImagePickerController.isCameraDeviceAvailable(.front) {
                    
                    imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.front
                }
                
            } else {
                
                return
            }
            
            imagePicker.allowsEditing = canEdit
            imagePicker.showsCameraControls = true
            imagePicker.delegate = delegate
            target.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // what to do with your image?
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK:  LOGOUT
    
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
}

extension HomeViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func optionsMenu() {
        
        let camera = Camera(delegate_: self)
        
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        optionMenu.popoverPresentationController?.sourceView = self.view
        
        let takePhoto = UIAlertAction(title: "Camera", style: .default) { (alert : UIAlertAction!) in
            camera.presentPhotoCamera(target: self, canEdit: true)
        }
        let sharePhoto = UIAlertAction(title: "Library", style: .default) { (alert : UIAlertAction) in
            camera.presentPhotoLibrary(target: self, canEdit: true)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert : UIAlertAction) in
            //
        }
        
        optionMenu.addAction(takePhoto)
        optionMenu.addAction(sharePhoto)
        
        optionMenu.addAction(cancel)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
}
