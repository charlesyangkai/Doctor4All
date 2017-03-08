//
//  HomeViewController.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/1/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var tableDoctors: [String] = ["General Practitioner","Therapist","Psychologist"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
}
