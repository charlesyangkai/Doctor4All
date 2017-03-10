//
//  CreateAccountController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import ImageRow
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import Eureka

class SignUpFormController: FormViewController {
    
    @IBOutlet weak var registerUsername: UITextField!
    
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            
            registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        }
        
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
        
        form +++ Section()
            
            
            <<< ImageRow() { row in
                row.title = "Image Row 1"
                row.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                row.clearAction = .yes(style: UIAlertActionStyle.destructive)
            }
            +++
            Section()
            <<< ImageRow() {
                $0.title = "Image Row 2"
                $0.sourceTypes = .PhotoLibrary
                $0.clearAction = .no
                }
                .cellUpdate { cell, row in
                    cell.accessoryView?.layer.cornerRadius = 17
                    cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
            }
            +++
            Section()
            <<< ImageRow() {
                $0.title = "Image Row 3"
                $0.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                $0.clearAction = .yes(style: .default)
        }
    
        form +++ Section("Credentials")
    
    
            <<< TextRow() {
                row in
                row.title = "Full Name"
                row.placeholder = "Full Name"
                row.tag = "registerFullName"
            }
            <<< TextRow() {
                row in
                row.title = "Email"
                row.placeholder = "Email"
                row.tag = "registerEmail"
            }
            <<< PasswordRow() {
                row in
                row.title = "Password"
                row.placeholder = "Password"
                row.tag = "registerPassword"
            }
            //            <<< TextRow() {
            //                row in
            //                row.title = "Confirm Password"
            //                row.placeholder = "Confirm Password"
            //                row.tag = "registerConformPassword"
            //            }
            <<< TextRow() {
                row in
                row.title = "Age"
                row.placeholder = "Age"
                row.tag = "registerAge"
            }
            
            <<< PickerInputRow<String>() {
                $0.title = "Gender"
                
                $0.options.append("Gender")
                $0.options.append("Male")
                $0.options.append("Female")
                $0.value = $0.options.first
            }
            <<< TextRow() {
                row in
                row.title = "Gender"
                row.placeholder = "Gender"
                row.tag = "registerGender"
            }
            <<< PhoneRow() {
                row in
                row.title = "Contact Number"
                row.placeholder = "Contact Number"
                row.tag = "registerNumber"
            }
            <<< TextAreaRow() {
                $0.title = "Address"
                $0.placeholder = "Address"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 100)
                $0.tag = "registerAddress"
            }
            
            +++ Section("Allergies and existing conditions")
            <<< TextAreaRow() {
                $0.placeholder = "Please seperate conditions with commas"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 150)
                $0.tag = "registerAilments"
            }
            
            +++ Section("Emergency Contact Name")
            <<< TextRow() {
                row in
                row.placeholder = "Emergency Contact Name"
                row.tag = "registerEmergencyName"
            }
            
            +++ Section("Emergency Contact Number")
            <<< PhoneRow() {
                row in
                row.placeholder = "Emergency Contact Number"
                row.tag = "registerEmergencyNumber"
            }
            
            +++ Section("Emergency Contact Relationship")
            <<< TextRow() {
                row in
                row.placeholder = "Emergency Contact Relationship"
                row.tag = "registerEmergencyRelationship"
            }
            
            +++ Section()
            <<< ButtonRow() {
                (row: ButtonRow) -> Void in
                row.title = "Sign Up"
                }
                .onCellSelection({ (cell, row) in
                    self.handleRegister()
                })
        
        
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
        
        let fullnameRow: TextRow? = self.form.rowBy(tag: "registerFullName")
        let emailRow: TextRow? = self.form.rowBy(tag: "registerEmail")
        let passwordRow: PasswordRow? = self.form.rowBy(tag: "registerPassword")
        //        let confirmPasswordRow: TextRow? = self.form.rowBy(tag: "registerConfirmPassword")
        let ageRow: TextRow? = self.form.rowBy(tag: "registerAge")
        let genderRow: TextRow? = self.form.rowBy(tag: "registerGender")
        let contactNumberRow: PhoneRow? = self.form.rowBy(tag: "registerNumber")
        let addressRow: TextAreaRow? = self.form.rowBy(tag: "registerAddress")
        let emergencyNameRow: TextRow? = self.form.rowBy(tag: "registerEmergencyName")
        let emergencyNumberRow: PhoneRow? = self.form.rowBy(tag: "registerEmergencyNumber")
        let emergencyRelationshipRow: TextRow? = self.form.rowBy(tag: "registerEmergencyRelationship")
        
        
        
        guard
            let fullname = fullnameRow?.value,
            let email = emailRow?.value,
            let password = passwordRow?.value,
            //            let confirmPassword = confirmPasswordRow?.value,
            let age = ageRow?.value,
            let gender = genderRow?.value,
            let contactNumber = contactNumberRow?.value,
            let address = addressRow?.value,
            let emergencyName = emergencyNameRow?.value,
            let emergencyNumber = emergencyNumberRow?.value,
            let emergencyRelationship = emergencyRelationshipRow?.value
            else { return }
        
        
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                
                print(error! as NSError)
                return
            }
            
            
            
            
            
            var userDictionary: [String: Any] = ["fullName": fullname , "email": email , "password": password, "age": age, "gender": gender, "contactNumber": contactNumber, "address": address, "emergencyContactName": emergencyName, "emergencyContactNumber": emergencyNumber, "emergencyContactRelationship": emergencyRelationship]
            
            if let urlString = self.profilePictureURL?.absoluteString {
                
                userDictionary["profilePicture"] = urlString
                
            }
            
            guard let validUserID = user?.uid else {return}
            
            self.dbRef.child("users").updateChildValues([validUserID : userDictionary])
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

extension SignUpFormController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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





















