//
//  User.swift
//  Doctor4All
//
//  Created by Charles Lee on 7/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation

class User {
    
    var name: String?
    var picture: URL?
    var email: String?
    var age: String?
    var gender: String?
    var allergiesAndConditions: String?
    var contactNumber: String?
    var address: String?
    var emergencyContact: String?
    var emergencyName: String?
    var emergencyRelationship: String?
    
    
    init(withDictionary dictionary: [String:Any]){
        
        name = dictionary["name"] as? String
        email = dictionary["email"] as? String
        age = dictionary["age"] as? String
        gender = dictionary["gender"] as? String
        allergiesAndConditions = dictionary["allergiesAndConditions"] as? String
        contactNumber = dictionary["contactNumber"] as? String
        address = dictionary["address"] as? String
        emergencyContact = dictionary["emergencyContact"] as? String
        emergencyRelationship = dictionary["emergencyRelationship"] as? String
       
        if let pictureURL = dictionary["picture"] as? String{
            picture = URL(string: pictureURL)
        }
        
    }
    
    
}

