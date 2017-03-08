//
//  Appointment.swift
//  Doctor4All
//
//  Created by Charles Lee on 7/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation

class Appointment{
    
    var userID: String?
    var condition: String?
    var home: Bool?
    var clinic: Bool?
    var date: String?
    var acceptedBy: String?
    
    
    init(withDictionary dictionary: [String: Any]){
        
        userID = dictionary["userID"] as? String
        condition = dictionary["condition"] as? String
        home = dictionary["home"] as? Bool
        clinic = dictionary["clinic"] as? Bool
        date = dictionary["date"] as? String
        acceptedBy = dictionary["acceptedBy"] as? String
        
    }
    
    
}
