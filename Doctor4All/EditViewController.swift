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
UINavigationControllerDelegate{

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
      //  EditViewController.title = "some title"
       // self.title= "Edit Profile"
        picker.delegate = self
        self.navigationItem.title = "Edit Profile"
    }
    
    //MARK: - Delegates
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("finished picking image")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //handle media here i.e. do stuff with photo
        
        print("imagePickerController called")
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        userProfilePic.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //what happens when you cancel
        //which, in our case, is just to get rid of the photo picker which pops up
        dismiss(animated: true, completion: nil)
    }
    
}
