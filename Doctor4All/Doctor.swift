//
//  Doctor.swift
//  Doctor4All
//
//  Created by Charles Lee on 2/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation

class Doctor {
    
    var name: String?
    var type: String? //dropdown
    var age: Int?
    var address: String?
    var picture: URL?
    var certPicture: URL?
    var icPicture: URL?
    var gender: String? // dropdown
    var verified: String?
    var contactNumber: String?
    var email: String?
    var clinicName: String?
    
    
    init(withDictionary dictionary: [String:Any]){
        
        name = dictionary["name"] as? String
        type = dictionary["type"] as? String
        age = dictionary["age"] as? Int
        address = dictionary["address"] as? String
        //picture = dictionary["picture"] as? String
        //certPicture = dictionary["certPicture"] as? String
        //icPicture = dictionary["icPicture"] as? String
        gender = dictionary["gender"] as? String
        verified = dictionary["verified"] as? String
        contactNumber = dictionary["contactNumber"] as? String
        email = dictionary["email"] as? String
        clinicName = dictionary["clinicName"] as? String
        
        
    }
    
    
    
}
