//
//  Doctor.swift
//  Doctor4All
//
//  Created by Charles Lee on 2/3/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class Doctor {
    
    var doctorID: String?
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
    
    
    static var current : Doctor = Doctor()
    init(){}
    
    init(withDictionary dictionary: [String:Any]){
        
        doctorID = dictionary["doctorID"] as? String
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
        
        if let pictureURL = dictionary["picture"] as? String{
            picture = URL(string: pictureURL)
        }
        
        if let certPictureURL = dictionary["certPicture"] as? String{
            certPicture = URL(string: certPictureURL)
        }
        
        if let icPictureURL = dictionary["icPicture"] as? String{
            icPicture = URL(string: icPictureURL)
        }
        
        
    }
    
    
    func fetchDoctorInformationViaID() {
        FIRDatabase.database().reference().child("doctors").child(doctorID!).observe(.value, with: { (snapshot) in
            guard let value = snapshot.value as? [String: Any] else {return}
            let newDoctor = Doctor(withDictionary: value)
            newDoctor.doctorID = snapshot.key
            
            Doctor.current = newDoctor
            
        })
    }

    
    
    
}
