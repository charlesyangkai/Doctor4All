//
//  EditDoctorProfileViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 13/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EditDoctorProfileViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate  {

     var dbRef: FIRDatabaseReference!
    
    @IBOutlet weak var doctorPofilePicture: UIImageView!
    @IBOutlet weak var doctorNameTF: UITextField!
    @IBOutlet weak var doctorEmailTF: UITextField!
    @IBOutlet weak var doctorPasswordTF: UITextField!
    @IBOutlet weak var doctorPhonNumTF: UITextField!
    @IBOutlet weak var doctorsAddressTF: UITextField!

        
        
    let picker = UIImagePickerController()
    
    @IBAction func choseImgBtn(_ sender: Any) {
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.present(picker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        self.title = "Edit Doctor Profile"
        
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let doctorPofilePicture = info[UIImagePickerControllerOriginalImage] as! UIImage
        // use the image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        performSegue(withIdentifier: "mySegue2", sender: nil)
    }



}
