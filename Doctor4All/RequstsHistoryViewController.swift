//
//  RequstsHistoryViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 12/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class RequstsHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

    var tableRequestsHistory: [String] = ["1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnMenu.target = self.revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell3", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableRequestsHistory.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
        
       let cell:TableViewCell3 = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell3
        cell.requestNumber.text = tableRequestsHistory[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
        
     //   performSegue(withIdentifier: "mySegue", sender: nil)

        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "RequstsHistory") as! ListHistoryViewController
        //revealviewcontroller.pushFrontViewController(newViewcontroller, animated: true)
        navigationController?.pushViewController(newViewcontroller, animated: true)

        

        
//        let storyboardd = UIStoryboard(name: "Home", bundle: Bundle.main)
//        let requestsHistoryVC = storyboardd.instantiateViewController(withIdentifier: "RequstsHistoryViewController") as? RequstsHistoryViewController
//        self.navigationController?.pushViewController(requestsHistoryVC!, animated: true)
//
//        let storyboardd = UIStoryboard(name: "Home", bundle: Bundle.main)
//        let newViewController = storyboardd.instantiateViewController(withIdentifier: "RequestsHistory") as? RequstsHistoryViewController
//        self.navigationController?.pushViewController(newViewController!, animated: true)
//  
       
    }
    
   



    

}
