//
//  RegisterViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/14/15.
//  Copyright (c) 2015 CMU IS. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var fnameInput: UITextField!
    @IBOutlet weak var lnameInput: UITextField!
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    // MARK: - Actions
    @IBAction func register(sender: AnyObject) {
        createUser()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    //function to save user to django app
    func createUser(){
        let request = NSMutableURLRequest(URL: NSURL(string: "https://thrift-cmu.herokuapp.com/create_user/")!)
        request.HTTPMethod = "POST"
        request.setValue("https://thrift-cmu.herokuapp.com/", forHTTPHeaderField : "Referer")
        
        let postString = "first_name=\(fnameInput)&last_name=\(lnameInput)&phone=\(phoneInput)&email=\(emailInput)&password=\(passwordInput)"
        
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            //print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
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
