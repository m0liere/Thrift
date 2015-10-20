//
//  ViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/5/15.
//  Copyright (c) 2015 Roei C-H. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    //MARK: - Outlets
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var conditionInput: UITextField!
    @IBOutlet weak var descInput: UITextField!
    @IBOutlet weak var photo0Input: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //Item object to store inputted information
    var newItem: item?

    
    // MARK: Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)

    }
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
    
    func saveItem(){
        let request = NSMutableURLRequest(URL: NSURL(string: "https://thrift-cmu.herokuapp.com/create_item/")!)
        request.HTTPMethod = "POST"
        request.setValue("https://thrift-cmu.herokuapp.com/", forHTTPHeaderField : "Referer")
        let postString = "user_id=INSERTSOMETHING&name=\(nameInput)&description=\(descInput)"
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
    
    
    // MARK: UIImagePickerControllerDelegate
    //Cancel photo selection
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    //Select photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //put photo into the imageview
        photo0Input.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
 
    }


    // MARK: - Actions
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        // Hide the keyboard if user taps while still in another textbox
        nameInput.resignFirstResponder()
        conditionInput.resignFirstResponder()
        descInput.resignFirstResponder()
        
        // UIImagePickerController - "lets a user pick media from their photo library"
        let imagePickerController = UIImagePickerController()
        
        //set source for image picker, can change to allow camera for demo on device
        imagePickerController.sourceType = .PhotoLibrary
        
        //Delegate 
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)

        
    }
    
    // MARK: - Std ViewController overrides
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


