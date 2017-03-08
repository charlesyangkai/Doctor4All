//
//  MenuViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 03/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var menuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuNameArray = ["Home","Message","Map","Setting"]
        iconArray = [UIImage(named:"home")!, UIImage(named:"message")!, UIImage(named:"map")!, UIImage(named:"setting")!]
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if cell.menuLabel.text! == "Home"
        {
            print("Home Tapped")
           
//            let storyboardd = UIStoryboard(name: "Home", bundle: Bundle.main)
//            let mapViewController = storyboardd.instantiateViewController(withIdentifier: "HomeViewController") as? UINavigationController
           
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
           
        }
        if cell.menuLabel.text! == "Message"
        {
            print("message Tapped")
//            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
//            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
//            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
        }
        if cell.menuLabel.text! == "Map"
        {
            print("Map Tapped")
//            
//            let storyboard = UIStoryboard(name: "Request", bundle: Bundle.main)
//            let controller = storyboard.instantiateViewController(withIdentifier: "MapViewController")
//                as? MapViewController
//            
        }
        if cell.menuLabel.text! == "Setting"
        {
            print("setting Tapped")
        }
    }
  
   

  

}
