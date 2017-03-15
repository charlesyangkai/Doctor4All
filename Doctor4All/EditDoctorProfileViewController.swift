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
        
        let optionMenu = UIAlertController(title: nil, message: "Where would you like the image from?", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let photoLibraryOption = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) -> Void in
            print("from library")
            //shows the photo library
            self.picker.allowsEditing = true
            self.picker.sourceType = .photoLibrary
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        })
        
        let cancelOption = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancel")
            self.dismiss(animated: true, completion: nil)
        })
        
        optionMenu.addAction(photoLibraryOption)
        optionMenu.addAction(cancelOption)
        
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        self.title = "Edit Doctor Profile"
        picker.delegate = self
        
    }
    
    //MARK: - Delegates
    //MARK: - Delegates
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("finished picking image")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //handle media here i.e. do stuff with photo
        
        print("imagePickerController called")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        doctorPofilePicture.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //what happens when you cancel
        //which, in our case, is just to get rid of the photo picker which pops up
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        performSegue(withIdentifier: "mySegue2", sender: nil)
    }



}
