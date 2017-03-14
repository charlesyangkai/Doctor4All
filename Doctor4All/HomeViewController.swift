//
//  HomeViewController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = 270.0
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }

  
    
    var tableDoctors: [String] = ["General Practitioner","Audiologist","Allergist","Andrologist","Cardiologist","Dentist","Dermatologist","ENT Specialist","Gynecologist","Neurologist","Oncologist","Orthopedist","Pediatrician","Physiologist","Podiatrist","Psychiatrist","Urologist","Veterinarian"]
    
    var tableDoctorsDetails: [String] = ["Treats illnesses and medical issues of all sorts, at all ages & medical non-emergency conditions.","Helps patients with different ear problems and help children who are either deaf or mute to learn to communicate.","Treats different kinds of allergies and immune system disorders like hay fever, asthma, etc.","Helps in diagnosing and treating disorders related to the male reproductive system.","Diagnoses and treats heart diseases and cardiovascular diseases.","Handles any dental problem from tooth decay to dentures to retainers. They also treat any gum diseases and oral defects.","Treats any ailment related to the skin and its appendages such as hair, nails etc.","Treats problems with the ear, nose and throat.","Studies and treats diseases of the female reproductive system.","Works with the human brain to determine causes and treatments for such serious illnesses as Alzheimer’s, Parkinson’s, Dementia, and many others","Diagnoses and treats cancer patients with drugs, chemotherapy, radiation and where needed, surgical interventions.","Treat broken bones from falls or osteoporosis.","Treats children for any illness from birth to adolescent.","Focuses on the functions of the human body to assess if they are working correctly and attempts to determine potential problems before they become an issue.","They are often referred to as 'foot doctors' and treat ailments that afflict the feet and ankles of patients.","Specializes in the treatment and diagnosis of mental disorder and behavioral problems.","Specializes in issues related to the urinary system, such as urinary tract infections.","Reponsible for the treatment of sick animals."]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMenu.target = self.revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView.delegate = self
        tableView.dataSource = self
     
        
       
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableDoctors.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
        
        let cell:TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.doctorTypeLabel.text = tableDoctors[indexPath.row]
        cell.descriptionLabel.text = tableDoctorsDetails[indexPath.row]
        cell.doctorTypeIcon.image = UIImage(named: tableDoctors[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
        
        
        let storyboardd = UIStoryboard(name: "Request", bundle: Bundle.main)
        let mapViewController = storyboardd.instantiateViewController(withIdentifier: "MapViewController") as? MapViewController
        self.navigationController?.pushViewController(mapViewController!, animated: true)
        
        mapViewController?.indexPathRow = indexPath.row
//        print(mapViewController?.indexPathRow)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 270
//    }
    
}
