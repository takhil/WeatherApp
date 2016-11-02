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
    
   

    var isCelcius :String = "0"
    var  dayTemp  :String = ""
    var  dayHTemp :String = ""
    var  dayLTemp :String = ""
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleText: UILabel!
   
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet weak var currentTemperature: UILabel!

    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var currentTemperatureImage: UIImageView!
    @IBOutlet weak var currentTemperatureCondition: UILabel!
    @IBOutlet weak var currentDay: UILabel!
    @IBOutlet weak var currentHighTemperature: UILabel!
    @IBOutlet weak var currentLowTemperature: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
 
   let locationManager = CLLocationManager()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayLabel.hidden = true
        settingButton.hidden = true
        editButton.hidden = true
        spinnerView.startAnimating()
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateCurrentTemp), name: "curretTempNotification", object:nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.updateTempScales), name: "tempScaleNotification", object:nil)
        
    }
    
    func updateTempScales(notify: NSNotification) {
        isCelcius = notify.object! as! String
        print("NSNOtification Called for scales",isCelcius)
        
        if isCelcius == "0"{
            
            currentTemperature?.text = dayTemp
            currentHighTemperature?.text = dayHTemp
            currentLowTemperature?.text = dayLTemp
        
        }
        else{
            
            currentTemperature?.text    = String((Int(dayTemp)!-32)*5/9) + "°"
            currentHighTemperature?.text = String((Int(dayHTemp)!-32)*5/9) + "°"
            currentLowTemperature?.text = String((Int(dayLTemp)!-32)*5/9) + "°"

        }

    }
    func updateCurrentTemp(notify: NSNotification) {
      let  currTempObj = notify.object! as! CurrentTemperature
        
        titleText?.text = currTempObj.currentLocation
     
        currentTemperature?.text = String(currTempObj.currentTemperatureInF) + "°"
        currentHighTemperature?.text = String(currTempObj.currentDayHighTemp) + "°"
        currentLowTemperature?.text = String(currTempObj.currentDayLowTemp) + "°"
     
        currentTemperatureCondition.text = currTempObj.currentIconType
        currentDay?.text = currTempObj.currentDay
        currentTemperatureImage?.image = UIImage(named:currTempObj.currentIcon)!
        
        dayTemp = String(currTempObj.currentTemperatureInF)
        dayHTemp = String(currTempObj.currentDayHighTemp)
        dayLTemp = String(currTempObj.currentDayLowTemp)
        
        spinnerView.stopAnimating()
        todayLabel.hidden = false
        spinnerView.hidden = true
        editButton.hidden = false
        settingButton.hidden = false
        
        editButton.addTarget(self, action: #selector(self.editAction), forControlEvents: .TouchUpInside)
        
        settingButton.addTarget(self, action: #selector(self.settigAction), forControlEvents: .TouchUpInside)
        
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
            
            let alertController = UIAlertController(title: "Error", message: " Error No internet connection", preferredStyle: .ActionSheet)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion:{
                alertController.view.superview?.userInteractionEnabled = true
                alertController.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeAlert)))
            })

            
        }
 
        
        
    }
    
    //MARK: - Settings BUtton Action

    
    
    
    func  settigAction(){
    
        print("Buton Action Pressed")
        
        let alert = UIAlertController(title: "Temperature Scales", message:"", preferredStyle: .ActionSheet)
    
        let fahrinHeat = UIAlertAction(title: "Fahrenheit", style: .Default, handler: {(action: UIAlertAction) -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName("tempScaleNotification", object:"0")
        })
   
        let celcius = UIAlertAction(title: "Celsius", style: .Default, handler: {(action: UIAlertAction) -> Void in
            
            NSNotificationCenter.defaultCenter().postNotificationName("tempScaleNotification", object:"1")
        })
        let cancel = UIAlertAction(title: "cancel", style: .Default, handler: {(action: UIAlertAction) -> Void in
        })
 

        alert.addAction(fahrinHeat)
        alert.addAction(celcius)
        alert.addAction(cancel)

        self.presentViewController(alert, animated: true, completion:{
            alert.view.superview?.userInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeAlert)))
        })


        
    }
    
    
    
    
    
//    @IBAction func settingsButton(sender: AnyObject) {
//        
//        print("Settings printed")
//    }
    
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
            
            if let zipCode = zipCodeTextField?.text {
                print(" ZipCode = \(zipCode)")
                
                
                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(zipCode) {
                    (placemarks, error) -> Void in
                    // Placemarks is an optional array of CLPlacemarks, first item in array is best guess of Address
                    
                    if let placemark = placemarks?[0] {
                        
//                        print("GET administrativeArea ",placemark.administrativeArea)
//                        
//                        print("GET locality ",placemark.locality)
//                        print("Get Country",placemark.country)
                        
              WeatherConnection.getTemperatures(zipCode,state:placemark.administrativeArea!,country:placemark.country!,locality:placemark.locality!)
                     
                    }
                    
                }
                
                
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
        self.presentViewController(alertController, animated: true, completion:{
            alertController.view.superview?.userInteractionEnabled = true
            alertController.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.closeAlert)))
        })
    }
   //Edit Action End
    func closeAlert(gesture: UITapGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

}//Class End

