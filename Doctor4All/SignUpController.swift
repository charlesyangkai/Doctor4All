//
//  CreateAccountController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import Eureka
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SignUpController: UIViewController {
    
    @IBOutlet weak var registerUsername: UITextField!
    
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            
            registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        }
        
    }
    
    @IBAction func finishRegister() {
        
        
    }
    
    @IBAction func showAlert() {
    
        let alert = UIAlertController(title: "Atteeention!", message: "Register completed, please do not resend register credentials", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Sir yes sir!", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    
    }
    
    var dbRef: FIRDatabaseReference!
    
    var profilePictureURL: URL?
    
    @IBOutlet weak var userSelectImage: UIImageView! {
        
        didSet {
            
            userSelectImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
            
            userSelectImage.isUserInteractionEnabled = true
            
            return
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        
        dbRef = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }
    
    func uploadProfileImage(image: UIImage) {
        
        let storageRef = FIRStorage.storage().reference()
        let metadata = FIRStorageMetadata()
        
        metadata.contentType = "image/jpeg"
        
        let timeStamp = String(Date.timeIntervalSinceReferenceDate)
        let convertedTimeStamp = timeStamp.replacingOccurrences(of: ".", with: "")
        let profilePictureName = ("image \(convertedTimeStamp).jpeg")
        
        guard let profilePictureData = UIImageJPEGRepresentation(image, 0.8) else {return}
        
        storageRef.child(profilePictureName).put(profilePictureData, metadata: metadata) { (meta, error) in
            self.dismiss(animated: true, completion: nil)
            
            if error != nil {
                
                print("No image detected")
                return
            }
            
            if let downloadUrl = meta?.downloadURL() {
                
                self.profilePictureURL = downloadUrl
            }
        }
    }
    
    func handleRegister() {
        
        FIRAuth.auth()?.createUser(withEmail: registerEmail.text!, password: registerPassword.text!, completion: { (user, error) in
            if error != nil {
                
                print(error! as NSError)
                return
            }
            
            var userDictionary: [String: Any] = ["username": self.registerUsername.text ?? "", "email": self.registerEmail.text ?? "", "password": self.registerPassword.text ?? ""]
            
            if let urlString = self.profilePictureURL?.absoluteString {
                
                userDictionary["profilePicture"] = urlString ?? "no URL"
                
            }
            
            guard let validUserID = user?.uid else {return}
            
            self.dbRef.child("username").updateChildValues([validUserID : userDictionary])
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension SignUpController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleSelectProfileImageView() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = editedImage
            
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            
            userSelectImage.image = selectedImage
        }
        
        uploadProfileImage(image: selectedImageFromPicker!)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}





















