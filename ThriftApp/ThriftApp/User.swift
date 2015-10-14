//
//  User.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/11/15.
//  Copyright (c) 2015 CMU IS. All rights reserved.
//

import Foundation
import UIKit

class user {
    var firstname: String!
    var lastname: String!
    //email address will serve as unique username
    var email: String!
    var password: String!
    var phone: String!
    var photo: UIImage?
    var stars: Int!
    
    init(firstname: String, lastname: String, email: String, password: String, phone: String, photo: UIImage? ){
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.phone = phone
        if let x = photo{
            self.photo = x
        }
        self.stars = 0 
        
        
    }
    
}