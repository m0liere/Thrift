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
    var date_posted: NSDate
    
    //Constructor method
    init(name: String, photo0: UIImage?, desc: String, status: String, condition: String, date_posted: NSDate){
        self.name = name
        self.photo0 = photo0
        self.desc = desc
        self.status = status
        self.condition = condition
        self.date_posted = date_posted

    }
    
    
}