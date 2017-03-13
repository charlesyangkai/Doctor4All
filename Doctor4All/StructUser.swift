//
//  structUser.swift
//  Doctor4All
//
//  Created by Kyle Gorter on 3/9/17.
//  Copyright © 2017 NextAcademy. All rights reserved.
//

import Foundation

struct StructUser: Equatable {
    var name: String
    var email: String
    var dateOfBirth: NSDate
    var pictureURL: NSURL?
}

func ==(lhs: StructUser, rhs: StructUser) -> Bool {
    return lhs.email == rhs.email
    
}

