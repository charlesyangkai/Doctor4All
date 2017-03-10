//
//  LogInController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

var currentUser: String?
class LogInController: UIViewController {
    
    
    
    @IBOutlet weak var backGroundImageView: UINavigationItem!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton! {
        
        didSet {
            
            logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        

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
        
        loadHomePage()
        
    }
    
    
    
    func loadHomePage() {
        let homePage = HomeViewController()
        present(homePage, animated: true, completion: nil)
        
    }

    
    @IBAction func showAlert() {
        
        
        
    }
    
    
    func handleUser(user: FIRUser){
        
        User.current.userID = user.uid
        User.current.fetchUserInformationViaID()
        
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
