//
//  EventDetailsViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 08/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EventDetailsViewController: UIViewController {

    
    var dbRef: FIRDatabaseReference!
    var viewMode : ViewMode = .new
    var indexPathRow: Int?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var acceptButton: UIButton!{
        didSet{
            acceptButton.addTarget(self, action: #selector(acceptAppointment), for: .touchUpInside)
        }
    }
    @IBOutlet weak var addressTV: UITextView!
    @IBOutlet weak var conditionTV: UITextView!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    
    
    @IBAction func showLocationBtn(_ sender: Any) {
    }
    
    func acceptAppointment() {
        
        //removing from database
        dbRef.child("appointments").child(DoctorHomeViewController.currentAppointments[indexPathRow!].appointmentID!).removeValue { error in
            if error != nil {
                print("error \(error)")
            }
            
            //removing from array
            DoctorHomeViewController.currentAppointments.remove(at: self.indexPathRow!)
            
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
    
        switch viewMode {
        case .new:
            historyLabel.isHidden = true
            currentLabel.isHidden = false
            acceptButton.isHidden = false
        case .history:
            historyLabel.isHidden=false
            currentLabel.isHidden = true
            acceptButton.isHidden = true
        }
       // menuButton.target = self.revealViewController()
       // menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }


}
