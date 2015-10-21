//
//  ItemTableViewController.swift
//  ThriftApp
//
//  Created by Roei C-H on 10/6/15.
//  Copyright (c) 2015 Roei C-H. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

    
    // MARK: - Sample data population
    //sample data array
    var items = [item]()
    
    
    func getItems(){
        let request = NSMutableURLRequest(URL: NSURL(string: "https://thrift-cmu.herokuapp.com/get_items/")!)
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
            
            
            //getItems post request gives 10 items
            
            
            //Parse json
            let parsed = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSMutableArray
            print(parsed[1])
            
            for i in self.items.count..<parsed.count{
                //unwrap all optionals in parsed data and update labels
                if let x = parsed[i]["description"] as? NSString,  y = parsed[i]["name"] as? NSString, z = parsed[i]["status"] as? NSString, a = parsed[i]["image"] as? String{
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        var newPic: UIImage!
                        if a == "" {
                            newPic = UIImage(named: "defaultPhoto")!
                        }else{
                            newPic = UIImage(named: a)!

                        }
                        var newItem = item(name: y as String, photo0: newPic, desc: x as String, status: z as String, condition: "")
                        self.items += [newItem]
                        self.tableView.reloadData()

                    })
                }
            }
            
            
            //print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print("responseString = \(responseString)")
        }
        task.resume()

    }
    
    
    //load sample data function
    func loadSampleData(){
        var item1pic = UIImage(named: "shirt")!
        var item1 = item(name: "Beatles Tee", photo0: item1pic, desc: "vintage beatles tee from the 71 concert tour",
            status:"Availible", condition: "Heavily Used")
        
        var item2pic = UIImage(named: "kitchenware")
        var item2 = item(name: "Assorted kitchenware", photo0: item2pic, desc: "cheese grater, small collinder, meat tenderizer...",
            status:"Claimed", condition: "Lightly Used")
        
        items += [item1,item2]
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        getItems()
    }
    
    // MARK: Standard ViewController Override
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleData()
        print("THE USER ID IS: \(user_info.user_id)")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
        
        // gets appropriate item with data to display
        let item = items[indexPath.row]
        cell.name.text = item.name
        cell.pic.image = item.photo0
        //these two variables need to be renamed, but will remain this way for testing
        cell.condition.text = item.desc
        cell.date.text = item.status
        

        


        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = items[indexPath.row]
                let controller = (segue.destinationViewController) as! ItemDetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    @IBAction func logout(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, newItem = sourceViewController.newItem {
            // Add a new item
            let newIndexPath = NSIndexPath(forRow: items.count, inSection: 0)
            items.append(newItem)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    
    

}
