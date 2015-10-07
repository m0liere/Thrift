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
    @IBOutlet weak var photo0Input: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
    This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
    or constructed as part of adding a new meal.
    */
    var newItem: item?

    
    // MARK: Navigation
    //configure a view controller before it's presented
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameInput.text ?? ""
            let condition = conditionInput.text ?? ""
            let desc = descInput.text ?? ""
            let photo = photo0Input.image
            
            //set item to pass between controllers (unwind segue)
            //starting status: 'availible'
            newItem = item(name: name, photo0: photo, desc: desc, status: "Available", condition: condition, date_posted: NSDate() )
            
        }
    }
    
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


