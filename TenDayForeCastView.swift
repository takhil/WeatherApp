//
//  TenDayForeCastView.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/16/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class TenDayForeCastView: UITableViewController {
    
    var foreCastTemps = [ForeCastTemperatures]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateforeCastTemp), name: "forecastTempNotification", object:nil)
        
    }
    
    func updateforeCastTemp(notify: NSNotification) {
        
    foreCastTemps = notify.object! as! [ForeCastTemperatures]
        
        print("NSNOtification Called in hours",foreCastTemps)
        self.tableView!.reloadData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foreCastTemps.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tenDayForecast", forIndexPath: indexPath)
        
        
        let  foreDict = foreCastTemps[indexPath.row]
        
        let daylabel : UILabel? = cell.contentView.viewWithTag(40) as? UILabel
        
        daylabel?.text = foreDict.foreCastDay
       // label?.textColor = UIColor .yellowColor()
        let tempHlabel : UILabel? = cell.contentView.viewWithTag(60) as? UILabel
        
        
        tempHlabel?.text = String(foreDict.foreCastHighTempInF)
        
        let tempLlabel : UILabel? = cell.contentView.viewWithTag(70) as? UILabel
        
        
        tempLlabel?.text = String(foreDict.foreCastLowTempInF)
        
        let foreCastImage : UIImageView? = cell.contentView.viewWithTag(50) as? UIImageView
        foreCastImage!.image! = UIImage(named:foreDict.foreCastIcon)!
        cell.backgroundColor = UIColor .clearColor()
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
