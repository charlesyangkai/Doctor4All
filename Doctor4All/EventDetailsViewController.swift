//
//  EventDetailsViewController.swift
//  Doctor4All
//
//  Created by Othman Mashaab on 08/03/2017.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {

    var viewMode : ViewMode = .new
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        switch viewMode {
        case .new:
            declineButton.isHidden = false
            acceptButton.isHidden = false
        case .history:
            declineButton.isHidden = true
            acceptButton.isHidden = true
        }
       // menuButton.target = self.revealViewController()
       // menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        // Do any additional setup after loading the view.
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
