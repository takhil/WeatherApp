//
//  HourlyTemperatureView.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/16/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

private let reuseIdentifier = "hourlyForecast"



class HourlyTemperatureView: UICollectionViewController {

    @IBOutlet var myCollectionView: UICollectionView!
    
    var isCelsius:String! = "0"
    
    var hourTemps = [HourlyTemperatures]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "hourlyForecast")

        // Do any additional setup after loading the view.

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateHourlyTemp), name: "hourlyTempNotification", object:nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateTempScales), name: "tempScaleNotification", object:nil)
        
    }
    func updateTempScales(notify: NSNotification) {
        isCelsius = notify.object! as! String
        print("NSNOtification Called for scales",isCelsius)
        print("NSNOtification Segment in hours",hourTemps)

        myCollectionView!.reloadData()
        
        
    }
    
    func updateHourlyTemp(notify: NSNotification) {

        hourTemps = notify.object! as! [HourlyTemperatures]
        
        print("NSNOtification Called in hours",hourTemps)
        myCollectionView!.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return hourTemps.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("hourlyForecast", forIndexPath: indexPath)
        
        let  hourDict = hourTemps[indexPath.row]
      
        
        // Configure the cell
        let timeLabel : UILabel? = cell.contentView.viewWithTag(10) as? UILabel
        timeLabel?.textColor = UIColor.init(red: 138.0, green: 180.0, blue: 174.0, alpha:1)
        timeLabel?.text = hourDict.hourlyTime
        let templabel : UILabel? = cell.contentView.viewWithTag(20) as? UILabel
        if(isCelsius == "1"){
           
            templabel?.text = String((hourDict.hourlyTemperatureInF - 32)*5/9)
        }
        else{
            
             templabel?.text = String(hourDict.hourlyTemperatureInF)
        }
        

        let hourlyImage : UIImageView? = cell.contentView.viewWithTag(30) as? UIImageView
        hourlyImage!.image! = UIImage(named:hourDict.hourlyIcon)!
        cell.backgroundColor = UIColor .clearColor()
        return cell
        
        
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
