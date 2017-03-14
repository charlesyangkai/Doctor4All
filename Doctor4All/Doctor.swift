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
    var age: String?
    var address: String?
    //var latitude: Double?
    //var longitude: Double?
    var picture: URL?
    var certPicture: URL?
    var icPicture: URL?
    var gender: String? // dropdown
    var verified: String?
    var contactNumber: String?
    var email: String?
    var clinicName: String?
    
    
    init(withDictionary dictionary: [String:Any]) {
        
        name = dictionary["name"] as? String
        type = dictionary["type"] as? String
        age = dictionary["age"] as? String
        address = dictionary["address"] as? String
        //latitude = dictionary["latitude"] as? Double
        //longitude = dictionary["longitude"] as? Double
        gender = dictionary["gender"] as? String
        verified = dictionary["verified"] as? String
        contactNumber = dictionary["contactNumber"] as? String
        email = dictionary["email"] as? String
        clinicName = dictionary["clinicName"] as? String
        
        if let pictureURL = dictionary["picture"] as? String {
            picture = URL(string: pictureURL)
        }
        
        if let certPictureURL = dictionary["certPicture"] as? String {
            certPicture = URL(string: certPictureURL)
        }
        
        if let icPictureURL = dictionary["icPicture"] as? String {
            icPicture = URL(string: icPictureURL)
        }
        
        
    }
    
    
    
}
