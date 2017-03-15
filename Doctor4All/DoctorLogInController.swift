//
//  LogInController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//
/*---------------------------------------------------------------------------------------
 Edit: Here is another way to do this task if you are going to use this functionality in multiple UIViewControllers:
 
 // Put this piece of code anywhere you like
 extension UIViewController {
 func hideKeyboardWhenTappedAround() {
 let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
 view.addGestureRecognizer(tap)
 }
 
 func dismissKeyboard() {
 view.endEditing(true)
 }
 }
 Now in every UIViewController, all you have to do is call this function:
 
 override func viewDidLoad() {
 super.viewDidLoad()
 self.hideKeyboardWhenTappedAround()
 }
 --------------------------------------------------------------------------------*/



import UIKit
import FirebaseAuth
import FirebaseDatabase

//var currentUser: String?
class DoctorLogInController: UIViewController, UIGestureRecognizerDelegate {
    // Initialize this for Keyboard cover textfield fix
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    
    @IBAction func doctorSignUp(_ sender: UIButton) {
        guard let doctorLogInDirection = storyboard?.instantiateViewController(withIdentifier: "RegisterDoctorController") as? RegisterDoctorController else {return}
        
        navigationController?.pushViewController(doctorLogInDirection, animated: true)
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton! {
        
        didSet {
            
            logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        }
    }
    
    
    
    
    
    func handleTap() {
        view.endEditing(true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: "handleTap")
        
        tap.delegate = self
        view.addGestureRecognizer(tap)
        handleTap()
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        // Keyboard covers textfield fix
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.keyboardHeightLayoutConstraint?.constant = 70.0
            } else {
                
                if let height = endFrame?.size.height {
                    self.keyboardHeightLayoutConstraint?.constant = height - 140
                }else {
                    self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 70.0
                }
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func logIn() {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil {
                
                let showError = UIAlertController(title: "Error", message: "Error", preferredStyle: .alert)
                
                let actionError = UIAlertAction(title: "Great...", style: .default, handler: nil)
                
                showError.addAction(actionError)
                
                self.present(showError, animated: true, completion: nil)
                print(error! as NSError)
                return
            }
            self.handleUser(user: user!)
            
            //Call self.loadChannelPage() here for customTabBarController
        })
        
        
    }
    
    
    
    func loadHomePage() {
        let storyboard = UIStoryboard(name: "DoctorHome", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "SWRevealViewController2")
            as? SWRevealViewController
        //let homePage = HomeViewController()
        present(controller!, animated: true, completion: nil)
        
    }
    
    
    @IBAction func showAlert() {
        
        
        
    }
    
    
    func handleUser(user: FIRUser){
        
        User.current.userID = user.uid
        User.current.fetchUserInformationViaID()
        loadHomePage()
        print("user logged in")
    }
    
    
    func loadChannelPage() {
        let docPage = String()
        
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
