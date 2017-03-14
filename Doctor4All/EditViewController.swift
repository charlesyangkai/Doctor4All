//
//  EditViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 12/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

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
    
    @IBAction func choseUserProfilePicBtn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
