//
//  EditViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 12/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class EditViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var userPassTF: UITextField!
    @IBOutlet weak var userEmailTF: UITextField!
    @IBOutlet weak var userPhonNumTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var choseImage: UIButton!
    @IBOutlet weak var userAddressTF: UITextField!
    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
    performSegue(withIdentifier: "mySegue", sender: nil)
    }
    
    @IBAction func updateProfileButton(_ sender: Any) {
        
    }
    
   
    let picker = UIImagePickerController()
    
    @IBAction func choseProfilePicBtn(_ sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.present(picker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  EditViewController.title = "some title"
       // self.title= "Edit Profile"
        self.navigationItem.title = "Edit Profile"
    }
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let userProfilePic = info[UIImagePickerControllerOriginalImage] as! UIImage
        // use the image
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
