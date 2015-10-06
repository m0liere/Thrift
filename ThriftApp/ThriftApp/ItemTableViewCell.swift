//
//  ItemTableViewCell.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/5/15.
//  Copyright (c) 2015 Roei C-H. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var condition: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
