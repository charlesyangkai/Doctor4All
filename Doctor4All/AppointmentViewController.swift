//
//  AppointmentViewController.swift
//  Doctor4All
//
//  Created by Charles Lee on 6/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AppointmentViewController: UIViewController, UITextFieldDelegate {
    
//    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
//    public var activeTextField : UITextField?
    
    var dbRef: FIRDatabaseReference!
    
    let datePicker = UIDatePicker()
    
    var checkBox1 = UIImage(named: "checked")
    var uncheckBox1 = UIImage(named: "unchecked")
    var isBox1Clicked: Bool = false
    
    var checkBox2 = UIImage(named: "checked")
    var uncheckBox2 = UIImage(named: "unchecked")
    var isBox2Clicked: Bool = false
    
    var checkBox3 = UIImage(named: "checked")
    var uncheckBox3 = UIImage(named: "unchecked")
    var isBox3Clicked: Bool = false
    
    var checkBox4 = UIImage(named: "checked")
    var uncheckBox4 = UIImage(named: "unchecked")
    var isBox4Clicked: Bool = false
    
    @IBOutlet weak var conditionTextView: UITextView!
    
    @IBOutlet weak var timeDateTextField: UITextField! {
        didSet{
            timeDateTextField.delegate = self
        }
    }
    
    
    
    @IBOutlet weak var datePickerText: UITextField! {
        didSet{
            datePickerText.delegate = self
        }
    }
    
    @IBOutlet weak var uncheckHome: UIButton!
    
    @IBOutlet weak var uncheckClinic: UIButton!
    
    @IBOutlet weak var uncheckMale: UIButton!
    
    @IBOutlet weak var uncheckFemale: UIButton!
    
    @IBAction func clickBox1(_ sender: Any) {
        
        if isBox1Clicked == true {
            
            isBox1Clicked = false
        }else{
            isBox1Clicked = true
        }
        
        
        if isBox1Clicked == true{
            uncheckHome.setImage(checkBox1, for: UIControlState.normal)
        }else{
            uncheckHome.setImage(uncheckBox1, for: UIControlState.normal)
        }
    }

    
    @IBAction func clickBox2(_ sender: Any) {
        
        if isBox2Clicked == true {
            
            isBox2Clicked = false
        }else{
            isBox2Clicked = true
        }
        
        if isBox2Clicked == true{
            uncheckClinic.setImage(checkBox2, for: UIControlState.normal)
        }else{
            uncheckClinic.setImage(uncheckBox2, for: UIControlState.normal)
        }
    }
    

    @IBAction func clickBox3(_ sender: Any) {
        
        if isBox3Clicked == true {
            
            isBox3Clicked = false
        }else{
            isBox3Clicked = true
        }
        
        if isBox3Clicked == true{
            uncheckMale.setImage(checkBox3, for: UIControlState.normal)
        }else{
            uncheckMale.setImage(uncheckBox3, for: UIControlState.normal)
        }
    }

    
    @IBAction func clickBox4(_ sender: Any) {
        
        if isBox4Clicked == true {
            
            isBox4Clicked = false
        }else{
            isBox4Clicked = true
        }
        
        if isBox4Clicked == true{
            uncheckFemale.setImage(checkBox4, for: UIControlState.normal)
        }else{
            uncheckFemale.setImage(uncheckBox4, for: UIControlState.normal)
        }
    }
    
    @IBOutlet weak var confirmAppointmentButton: UIButton!{
        didSet{
            confirmAppointmentButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        

//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
         dbRef = FIRDatabase.database().reference()

        createDatePicker()
        
        
        self.hideKeyboardWhenTappedAround()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//        
//        
//    }
    
    
    

//func keyboardNotification(notification: NSNotification) {
//    if let userInfo = notification.userInfo {
//        guard
//            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
//            let activeFrame = activeTextField?.frame else {
//                animatePushKeyboard(userInfo, toHeight: 10.0)
//                return
//        }
//        
//        
//        if activeFrame.maxY < endFrame.minY {
//            animatePushKeyboard(userInfo, toHeight: 10.0)
//            return
//        }
//        
//        
//        if endFrame.origin.y >= UIScreen.main.bounds.size.height {
//            animatePushKeyboard(userInfo, toHeight: 10.0)
//        } else {
//            animatePushKeyboard(userInfo, toHeight: endFrame.size.height)
//        }
//        
//    }
//    
//}

//func animatePushKeyboard(_ userInfo:[AnyHashable:Any], toHeight: CGFloat){
//    
//    self.keyboardHeightLayoutConstraint?.constant = toHeight
//    let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
//    let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
//    let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
//    let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
//    UIView.animate(withDuration: duration,
//                   delay: TimeInterval(0),
//                   options: animationCurve,
//                   animations: { self.view.layoutIfNeeded() },
//                   completion: nil)
//}

//func textFieldDidBeginEditing(_ textField: UITextField) {
//    activeTextField = textField
//}


    func createDatePicker(){
        
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        datePickerText.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        datePickerText.inputView = datePicker
    }
    
    
    func donePressed(){
        
        // format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        datePickerText.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    func buttonTapped(){
        
        uploadAppointment()

            let alert = UIAlertController(title: "Appointment", message: "Your request for a doctor is being proccessed.", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Okay", style: .default) { (_) in
            //call function
            let storyboardd = UIStoryboard(name: "Request", bundle: Bundle.main)
            let descriptionViewController = storyboardd.instantiateViewController(withIdentifier: "DescriptionViewController") as? DescriptionViewController
            self.navigationController?.pushViewController(descriptionViewController!, animated: true)
        }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
    }
    
    
    func uploadAppointment(){
        
        guard let currentUserID = User.current.userID else {return}
        
        var userDictionary: [String: Any] = ["userID": currentUserID , "condition": conditionTextView.text , "home": isBox1Clicked, "clinic": isBox2Clicked, "timeDate": timeDateTextField.text, "acceptedBy": ""]
        
        
        let ref = self.dbRef.child("appointments").childByAutoId()
        
        userDictionary["appointmentID"] = ref.key
        
        ref.setValue(userDictionary)
        
        
    }


}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

