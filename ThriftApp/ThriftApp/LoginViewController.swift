//
//  LoginViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/14/15.
//  Copyright (c) 2015 CMU IS. All rights reserved.
//

import UIKit
import user_info


class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var user_id: String!
    
    
    //MARK: - Actions
    @IBAction func login(sender: AnyObject) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://thrift-cmu.herokuapp.com/login/")!)
        request.HTTPMethod = "POST"
        request.setValue("https://thrift-cmu.herokuapp.com/", forHTTPHeaderField : "Referer")
        
        let postString = "email=\(usernameInput.text)&password=\(passwordInput.text)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            //print("response = \(response)")
            
            let parsed = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            let id_int = parsed["user_id"]! as! NSNumber
            let aString = "\(id_int)"
            user_info.user_id = aString
            
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print("responseString = \(responseString)")
        }
        task.resume()
        

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
