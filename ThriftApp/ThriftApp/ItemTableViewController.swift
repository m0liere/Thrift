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
    
    //load sample data function
    func loadSampleData(){
        var item1pic = UIImage(named: "shirt")!
        var item1 = item(name: "Beatles Tee", photo0: item1pic, desc: "vintage beatles tee from the 71 concert tour",
            status:"Availible", condition: "Heavily Used", date_posted: NSDate())
        
        var item2pic = UIImage(named: "kitchenware")
        var item2 = item(name: "Assorted kitchenware", photo0: item2pic, desc: "cheese grater, small collinder, meat tenderizer...",
            status:"Claimed", condition: "Lightly Used", date_posted: NSDate())
        
        items += [item1,item2]
        
        
    }
    // MARK: Standard ViewController Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleData()

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
        cell.condition.text = item.condition
        
        //reformat date to be displayed in label as string 
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        cell.date.text = dateFormatter.stringFromDate(item.date_posted)
        


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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Actions
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, newItem = sourceViewController.newItem {
            // Add a new item
            let newIndexPath = NSIndexPath(forRow: items.count, inSection: 0)
            items.append(newItem)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }

}
