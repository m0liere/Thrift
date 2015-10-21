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
    @IBOutlet weak var name: UILabel!
 
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var keywords: UITextField!
    
    var detailItem: item? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        // Update the user interface for the detail item.
        if let detail: item = self.detailItem {
            if let name = self.name {
                name.text = detail.name
            }
            if let desc = self.desc {
                desc.text = detail.desc
            }
            if let photo = self.photo {
                photo.image = detail.photo0
            }
        }
    }
    
    /*this action should call function in the model
        
    */
    @IBAction func requestItem(sender: UIButton) {
        let request = NSMutableURLRequest(URL: NSURL(string: "https://thrift-cmu.herokuapp.com/request_item/")!)
        request.HTTPMethod = "POST"
        request.setValue("https://thrift-cmu.herokuapp.com/", forHTTPHeaderField : "Referer")
        let postString = ""
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

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
