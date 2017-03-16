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
UINavigationControllerDelegate, UITextFieldDelegate{
    
//    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?

    @IBOutlet weak var userPassTF: UITextField! {
        didSet {
            userPassTF.delegate = self
        }
    }
    @IBOutlet weak var userEmailTF: UITextField! {
        didSet {
            userEmailTF.delegate = self
        }
    }
    @IBOutlet weak var userPhonNumTF: UITextField! {
        didSet {
            userPhonNumTF.delegate = self
        }
    }
    @IBOutlet weak var userNameTF: UITextField!{
        didSet {
            userNameTF.delegate = self
        }
    }
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var choseImage: UIButton!
    @IBOutlet weak var userAddressTF: UITextField!{
        didSet {
            userAddressTF.delegate = self
        }
    }
    
//    public var activeTextField : UITextField?
    
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
        
        self.hideKeyboardWhenTappedAround()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
    
        
//    }
    
////    func keyboardNotification(notification: NSNotification) {
//        if let userInfo = notification.userInfo {
//            guard
//                let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
//                let activeFrame = activeTextField?.frame else {
//                    animatePushKeyboard(userInfo, toHeight: 10.0)
//                    return
//            }
//            
//            
//            if activeFrame.maxY < endFrame.minY {
//                animatePushKeyboard(userInfo, toHeight: 10.0)
//                return
//            }
//            
//            
//            if endFrame.origin.y >= UIScreen.main.bounds.size.height {
//                animatePushKeyboard(userInfo, toHeight: 10.0)
//            } else {
//                animatePushKeyboard(userInfo, toHeight: endFrame.size.height)
//            }
//            
////        }
    
//    }
    
//    func animatePushKeyboard(_ userInfo:[AnyHashable:Any], toHeight: CGFloat){
//        
//        self.keyboardHeightLayoutConstraint?.constant = toHeight
//        let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
//        let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
//        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
//        let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
//        UIView.animate(withDuration: duration,
//                       delay: TimeInterval(0),
//                       options: animationCurve,
//                       animations: { self.view.layoutIfNeeded() },
//                       completion: nil)
//    }
    
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
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        activeTextField = textField
//    }
    
}


    

