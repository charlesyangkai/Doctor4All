//
//  Menu2ViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 07/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit
import FirebaseAuth

class Menu2ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var menuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuNameArray = ["Homepage","Requests History","Profile Settings","Logout"]
        iconArray = [UIImage(named:"home")!, UIImage(named:"message")!, UIImage(named:"setting")!, UIImage(named: "profile-icon")!]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLogout() {
        do {
            try FIRAuth.auth()?.signOut()
        }catch let logoutError {
            print(logoutError)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func logOut(){
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            self.handleLogout()
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.menuLabel.text! = menuNameArray[indexPath.row]
        cell.menuIcon.image = iconArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let cell:MenuCell = tableView.cellForRow(at: indexPath) as! MenuCell
        print(cell.menuLabel.text!)
        
        if cell.menuLabel.text! == "Homepage"
        {
            print("Home Tapped")

            let mainstoryboard:UIStoryboard = UIStoryboard(name: "DoctorHome", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "DoctorHomeViewController") as! DoctorHomeViewController
            newViewcontroller.viewMode = .new
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
            return
        }
        
        if cell.menuLabel.text! == "Requests History"{
            print("requests Tapped")
            
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "DoctorHome", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "DoctorHomeViewController") as! DoctorHomeViewController
            newViewcontroller.viewMode = .history
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            return
        }
        
//        if cell.menuLabel.text! == "Map"{
//            print("Map Tapped")
//            //
//            //            let storyboard = UIStoryboard(name: "Request", bundle: Bundle.main)
//            //            let controller = storyboard.instantiateViewController(withIdentifier: "MapViewController")
//            //                as? MapViewController
//            //
//        }
       
        if cell.menuLabel.text! == "Profile Settings"{
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "DoctorHome", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "EditDoctorVC") as! EditDoctorProfileViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            print("setting Tapped")
        }
        
        if cell.menuLabel.text! == "Logout"{
            
            logOut()
            print("Logout Tapped")
        }
        
        

}
}

