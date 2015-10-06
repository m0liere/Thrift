//
//  ViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/5/15.
//  Copyright (c) 2015 Roei C-H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
 
    //outlets
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var conditionInput: UITextField!
    @IBOutlet weak var descInput: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //deligate handling for text inputs
        nameInput.delegate = self
        conditionInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


