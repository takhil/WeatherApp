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
    


    @IBAction func segmentAction(sender: UISegmentedControl) {
        
        let segmentedControl = (sender )
        let selectedSegment = segmentedControl.selectedSegmentIndex
        if selectedSegment == 0 {
            //toggle the correct view to be visible
           isCelcius = "0"
        }
        else {
            //toggle the correct view to be visible
            isCelcius = "1"
                    }
        
        NSNotificationCenter.defaultCenter().postNotificationName("tempScaleNotification", object:isCelcius)

        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
