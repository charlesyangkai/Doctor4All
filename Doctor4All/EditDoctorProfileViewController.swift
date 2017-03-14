//
//  EditDoctorProfileViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 13/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EditDoctorProfileViewController: UIViewController {

     var dbRef: FIRDatabaseReference!
    
    @IBOutlet weak var doctorPofilePicture: UIImageView!
    @IBOutlet weak var doctorNameTF: UITextField!
    @IBOutlet weak var doctorEmailTF: UITextField!
    @IBOutlet weak var doctorPasswordTF: UITextField!
    @IBOutlet weak var doctorPhonNumTF: UITextField!
    @IBOutlet weak var doctorsAddressTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dbRef = FIRDatabase.database().reference()
   
        
    }
    
    
    
    
    
    @IBAction func choseImgBtn(_ sender: Any) {
        
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        performSegue(withIdentifier: "mySegue2", sender: nil)
    }



}
