//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/15/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherView: UIViewController,UIPopoverPresentationControllerDelegate,CLLocationManagerDelegate {
    
    var isCelcius:String = ""
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleText: UILabel!
   
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet weak var currentTemperature: UILabel!

    @IBOutlet weak var currentTemperatureImage: UIImageView!
    @IBOutlet weak var currentTemperatureCondition: UILabel!
    @IBOutlet weak var currentDay: UILabel!
    @IBOutlet weak var currentHighTemperature: UILabel!
    @IBOutlet weak var currentLowTemperature: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
 
   let locationManager = CLLocationManager()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.hidden = true
        spinnerView.startAnimating()
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateCurrentTemp), name: "curretTempNotification", object:nil)
//        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateTempScales), name: "tempScaleNotification", object:nil)
        
    }
    
//    func updateTempScales(notify: NSNotification) {
//        isCelcius = notify.object! as! String
//        print("NSNOtification Called for scales",isCelcius)
//       
//        
//        
//    }

 
    func updateCurrentTemp(notify: NSNotification) {
        let currTempObj = notify.object! as! CurrentTemperature
        
        print("NSNOtification Called in current view",currTempObj)
        titleText?.text = currTempObj.currentLocation
        currentTemperature?.text = String(currTempObj.currentTemperatureInF)
        currentTemperatureCondition.text = currTempObj.currentIconType
        currentDay?.text = currTempObj.currentDay
        currentHighTemperature?.text = String(currTempObj.currentDayHighTemp)
        currentLowTemperature?.text = String(currTempObj.currentDayLowTemp)
        
        currentTemperatureImage?.image = UIImage(named:currTempObj.currentIcon)!
        spinnerView.stopAnimating()
        spinnerView.hidden = true
        editButton.hidden = false
        
        editButton.addTarget(self, action: #selector(self.editAction), forControlEvents: .TouchUpInside)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getLocation(){
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" , error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        
        var locality:String!
        var postalCode:String!
        var administrativeArea:String!
        var country:String!
        
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            
            locationManager.stopUpdatingLocation()
            
             locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
             postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
             administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
             country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
//            print("The Location info is::",locality)
//            print("The Location info is::",postalCode)
//            print("The Location info is::",administrativeArea)
//            print("The Location info is::",country)
        
        }
        
    
        WeatherConnection.getTemperatures(postalCode,state:administrativeArea,country:country,locality:locality)
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    

    override func viewDidAppear(animated: Bool) {

        if Reachability.isConnectedToNetwork() {
            
            self.getLocation()
            
        }
        else {
            
            //print("No  Internet connected")
            
            let alertController = UIAlertController(title: "Error", message: " Error No internet connection", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion:nil)
            
        }
 
        
        
    }
    
    //MARK: - Settings BUtton Action
    //MARK: - Segue for POP Over Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "settingsPopOver"{
            
            let popOverViewController = segue.destinationViewController
            
            popOverViewController.popoverPresentationController?.delegate=self
        }
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    
    //MARK: - Edit Button Actiton
    
    
    func editAction() {
        print("Edit  buton pressed")
        
        var zipCodeTextField: UITextField?
        
        let alertController = UIAlertController(
            title: "Edit Location",
            message: "Enter your postal code below",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(
        title: "Ok", style: UIAlertActionStyle.Default) {
            (action) -> Void in
            
            if let zipcode = zipCodeTextField?.text {
                print(" ZipCode = \(zipcode)")
            } else {
                print("No ZipCode entered")
            }
            
        }
        
        alertController.addTextFieldWithConfigurationHandler {
            (txtUsername) -> Void in
            zipCodeTextField = txtUsername
            zipCodeTextField!.placeholder = "e.g 02452"
            zipCodeTextField?.keyboardType = UIKeyboardType.NumberPad
            
        }
        
        alertController.addAction(loginAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
   //Edit Action End
    
    
    
    

}//Class End

