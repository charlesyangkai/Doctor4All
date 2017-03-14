//
//  Appointment.swift
//  Doctor4All
//
//  Created by Charles Lee on 7/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class Appointment{
    
    var appointmentID: String?
    var userID: String?
    var condition: String?
    var home: Bool?
    var clinic: Bool?
    var timeDate: String?
    var acceptedBy: String?
    
    
    init(withDictionary dictionary: [String: Any]){
        
        appointmentID = dictionary["appointmentID"] as? String
        userID = dictionary["userID"] as? String
        condition = dictionary["condition"] as? String
        home = dictionary["home"] as? Bool
        clinic = dictionary["clinic"] as? Bool
        timeDate = dictionary["timeDate"] as? String
        acceptedBy = dictionary["acceptedBy"] as? String
        
    }
    
    
}
