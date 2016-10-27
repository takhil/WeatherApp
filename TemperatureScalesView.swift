//
//  TemperatureScalesView.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/16/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class TemperatureScalesView: UIViewController {
    
    var isCelcius:String!
    
    @IBOutlet weak var tempScaleControl: UISegmentedControl!
    
    @IBAction func tempScaleButton(sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex
        {
        case 0:
            isCelcius = "0"
        case 1:
            isCelcius = "1"
    
        default:
            
            break; 
        }
        NSNotificationCenter.defaultCenter().postNotificationName("tempScaleNotification", object:isCelcius)
        
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
