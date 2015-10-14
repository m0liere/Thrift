//
//  ItemDetailViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/11/15.
//  Copyright (c) 2015 CMU IS. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var desc: UITextView!

    
    /*this action should call function in the model 
        
    */
    @IBAction func requestItem(sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
