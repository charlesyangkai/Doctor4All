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
UINavigationControllerDelegate, UITextFieldDelegate  {
    
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?

     var dbRef: FIRDatabaseReference!
    
    @IBOutlet weak var doctorPofilePicture: UIImageView!
    @IBOutlet weak var doctorNameTF: UITextField! {
        didSet{
            doctorNameTF.delegate = self
        }
    }
    @IBOutlet weak var doctorEmailTF: UITextField! {
        didSet{
            doctorEmailTF.delegate = self
        }
    }
    @IBOutlet weak var doctorPasswordTF: UITextField! {
        didSet{
            doctorPasswordTF.delegate = self
        }
    }
    @IBOutlet weak var doctorPhonNumTF: UITextField! {
        didSet{
            doctorPhonNumTF.delegate = self
        }
    }
    @IBOutlet weak var doctorsAddressTF: UITextField! {
        didSet{
            doctorsAddressTF.delegate = self
        }
    }

    public var activeTextField: UITextField?
        
        
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
        
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        
        
    }

    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            guard
                let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
                let activeFrame = activeTextField?.frame else {
                    animatePushKeyboard(userInfo, toHeight: 17.0)
                    return
            }
            
            
            if activeFrame.maxY < endFrame.minY {
                animatePushKeyboard(userInfo, toHeight: 17.0)
                return
            }
            
            
            if endFrame.origin.y >= UIScreen.main.bounds.size.height {
                animatePushKeyboard(userInfo, toHeight: 17.0)
            } else {
                animatePushKeyboard(userInfo, toHeight: endFrame.size.height)
            }
            
        }
        
    }
    
    func animatePushKeyboard(_ userInfo:[AnyHashable:Any], toHeight: CGFloat){
        
        self.keyboardHeightLayoutConstraint?.constant = toHeight
        let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
        UIView.animate(withDuration: duration,
                       delay: TimeInterval(0),
                       options: animationCurve,
                       animations: { self.view.layoutIfNeeded() },
                       completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
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
