//
//  ProfileViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/12/15.
//  Copyright (c) 2015 CMU IS. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //current user variabled
    var fname: String!
    var lname: String!
    var email: String!
    var phone: String!
    
    
    func updateLabels(){
        firstnameLabel.text = fname
        lastnameLabel.text = lname
        emailLabel.text = email
        phoneLabel.text = phone
    }
    
    func getUserInfo(){
        let request = NSMutableURLRequest(URL: NSURL(string: "https://thrift-cmu.herokuapp.com/get_user/")!)
        request.HTTPMethod = "POST"
        request.setValue("https://thrift-cmu.herokuapp.com/", forHTTPHeaderField : "Referer")
        let postString = "user_id=1"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            let parsed = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
            
            
            if let x = parsed["first_name"] as? NSString{
                var fname = x as! String
                //print(fname)
                self.fname = fname
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.firstnameLabel.text = x as String
                })
//                self.firstnameLabel.text = x as String
            }
            
            //print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print("responseString = \(responseString)")
        }
        task.resume()
        print(self.fname)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        updateLabels()

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
