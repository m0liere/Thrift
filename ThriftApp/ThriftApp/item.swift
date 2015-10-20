//
//  item.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/6/15.
//  Copyright (c) 2015 Roei C-H. All rights reserved.
//

import Foundation
import UIKit

class item{
    
    //properties
    var name: String
    var photo0: UIImage?
    var desc: String
    var status: String
    var condition: String
    //var user_id: Int!
    
    //Constructor method
    init(name: String, photo0: UIImage?, desc: String, status: String, condition: String){
        self.name = name
        //unpack optional image (although there is a default image 
        if let x = photo0{
            self.photo0 = x

        }
        self.desc = desc
        self.status = status
        self.condition = condition

    }
    
    
}