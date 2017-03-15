//
//  DoctorHomeViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 07/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseDatabase

enum ViewMode {
    case new
    case history
}

class DoctorHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewMode : ViewMode = .new
    var dbRef: FIRDatabaseReference!
    var displayThisName: String?
    var displayThisAddress: String?
    
    
    
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var availableSwitch: UISwitch!
    @IBOutlet weak var btnMenu2: UIBarButtonItem!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!
    @IBOutlet weak var stackView : UIStackView!
    
    //var tableRequests: [String] = ["person1","peson2","person3"]
    static var currentAppointments: [Appointment] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        
        btnMenu2.target = self.revealViewController()
        btnMenu2.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
        switch viewMode {
        case .new:
            // call a function for new
            historyLabel.isHidden = true
            homeLabel.isHidden = false
            stackView.isHidden = false
            observeAllDoctors()
            break
        case .history:
            historyLabel.isHidden = false
            homeLabel.isHidden = true
            stackView.isHidden = true
            observeDoctorHistories()
            // call a function for history
            break
        }
        
        
        let nib = UINib(nibName: "TableViewCell2", bundle: nil)
        tableView2.register(nib, forCellReuseIdentifier: "cell")
        
        
        observeAppointments()
        
    }
    
    
    func observeAllDoctors(){
        // obsever firebase for new
    }
    
    func observeDoctorHistories(){
        // observe firebase for histories
    }
    
    func observeAppointments(){
        
        dbRef.child("appointments").observe(.childAdded, with: { (snapshot) in
            
            guard let value = snapshot.value as? [String: Any] else {return}
            
            let newAppointment = Appointment(withDictionary: value)
            
            newAppointment.appointmentID = snapshot.key
            
            self.appendAppointment(newAppointment)
        })
    }
    
    
    
    func appendAppointment(_ appointment: Appointment){
        DoctorHomeViewController.currentAppointments.append(appointment)
        tableView2.reloadData()
    }
    
    
    @IBAction func changSwitch(_ sender: UISwitch) {
        if availableSwitch.isOn == true{
            
            tableView2.isHidden = false
            //            eventLab.isHidden = false
            //            detailsLab.isHidden = false
            //            locationLab.isHidden = false
            //            timerLab.isHidden = false
            //            decButton.isHidden = false
            //            accButton.isHidden = false
            //
        }
            
        else {
            
            tableView2.isHidden = true
            //            eventLab.isHidden = true
            //            detailsLab.isHidden = true
            //            locationLab.isHidden = true
            //            timerLab.isHidden = true
            //            decButton.isHidden = true
            //            accButton.isHidden = true
            
        }
        
    }
    
    func observeNameAndAddress(indexpathrow: Int){
        
        dbRef.child("users").child(DoctorHomeViewController.currentAppointments[indexpathrow].userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let name = value?["fullName"] as? String ?? ""
            self.displayThisName = name
            let address = value?["address"] as? String ?? ""
            self.displayThisAddress = address
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctorHomeViewController.currentAppointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
        
        let cell:TableViewCell2 = self.tableView2.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell2
        
        let appointment = DoctorHomeViewController.currentAppointments[indexPath.row]
        
        observeNameAndAddress(indexpathrow: indexPath.row)
        
        cell.patientLabel.text = displayThisName
        cell.condLabel.text = appointment.condition
        cell.addLabel.text = displayThisAddress
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
        
        
        //        let currentStoryboard : String! = self.restorationIdentifier
        //        if currentStoryboard == "DoctorHomeViewController" {
        
        
        let storyboard = UIStoryboard(name: "DoctorHome", bundle: Bundle.main)
        let eventViewController = storyboard.instantiateViewController(withIdentifier: "EventDetailsNav") as? EventDetailsViewController
        eventViewController?.viewMode = viewMode
        eventViewController?.indexPathRow = indexPath.row
        self.navigationController?.pushViewController(eventViewController!, animated: true)
        
        
        //        }
        
        //        else if currentStoryboard == "DoctorHomeViewController" {
        //            let storyboard = UIStoryboard(name: "DoctorHome", bundle: Bundle.main)
        //            let eventViewController = storyboard.instantiateViewController(withIdentifier: "RequestsHistory") as? EventDetailsViewController
        //            eventViewController?.viewMode = .history
        //            self.navigationController?.pushViewController(eventViewController!, animated: true)
        //        }
        
        //        if let storyboardName = self.storyboard?.value(forKey: "name") as? String, storyboardName == "DoctorHomeViewController"  {
        //
        //        let storyboardd = UIStoryboard(name: "DoctorHome", bundle: Bundle.main)
        //        let eventViewController = storyboardd.instantiateViewController(withIdentifier: "EventDetailsNav") as? UIViewController
        //        self.navigationController?.pushViewController(eventViewController!, animated: true)
        //        }
        //
        //        else{
        //            let storyboardd = UIStoryboard(name: "DoctorHome", bundle: Bundle.main)
        //            let eventViewController = storyboardd.instantiateViewController(withIdentifier: "RequestsHistory") as? UIViewController
        //            self.navigationController?.pushViewController(eventViewController!, animated: true)
        //        }
        
    }
}




