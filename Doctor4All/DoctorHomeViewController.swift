//
//  DoctorHomeViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 07/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class DoctorHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var availableSwitch: UISwitch!
    @IBOutlet weak var btnMenu2: UIBarButtonItem!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var loadingCircle: UIActivityIndicatorView!
    
    var tableRequests: [String] = ["person1","peson2","person3"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu2.target = self.revealViewController()
        btnMenu2.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView2.delegate = self
        tableView2.dataSource = self
        
        
        let nib = UINib(nibName: "TableViewCell2", bundle: nil)
        tableView2.register(nib, forCellReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
        
        let cell:TableViewCell2 = self.tableView2.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell2
        
        cell.patientLabel.text = tableRequests[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
        
        
        let storyboardd = UIStoryboard(name: "DoctorHome", bundle: Bundle.main)
        let eventViewController = storyboardd.instantiateViewController(withIdentifier: "EventDetailsNav") as? UIViewController
        self.navigationController?.pushViewController(eventViewController!, animated: true)
        //        mapViewController?.indexPathRow = indexPath.row
        //        print(mapViewController?.indexPathRow)
    }
    
    
    
}
