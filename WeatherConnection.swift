//
//  WeatherConnection.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/16/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import Foundation



class WeatherConnection: NSObject {
    
    //Empty dictionary to store the value of objects to show in UI 
    
    //var temperaturesDict = [AnyObject]()
   
    
    //MARK: - to get all  the temperatures with query parameters
    
    class func getTemperatures(zipCode:String,state:String,country:String,locality:String){
        
      
        print("The Location info is::",zipCode)
        print("The Location info is::",state)
        print("The Location info is::",country)
        print("The Location info is::",locality)
        
        
        //MARK: - Cuurent Locatin Temperature and Conditions 
        
     // let currentTempUrl:String = "https://api.myjson.com/bins/4knis"
        
        let currentTempUrl:String = "http://api.wunderground.com/api/84463b41774b4b88/conditions/q/" + state + "/" + locality + ".json"
        
        print("currentTempUrl",currentTempUrl)
        let url = NSURL(string: currentTempUrl)!
        
        
   
     let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler:{(data, response, error) -> Void in
            
        
            if(error == nil){
                
                do {
                    
                    let currentTempDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
        
                    //print("Current Weather Conditions::",currentTempDict)
                    
                    let resultDict = currentTempDict?.objectForKey("current_observation") as! NSDictionary
                    
                    // print("result Dictionary::",resultDict)
       
                    let locationDict = resultDict.objectForKey("display_location") as! NSDictionary
  
                    // print("location Dictionary::",locationDict)
 
                    let currentLocation         =   locationDict["city"] as! String
                    
                    let currentTemperatureInF   =  Int( resultDict["temp_f"] as! Float)
                    
                    //to get the current day from teh system
                    let date = NSDate()
                    let dateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "EEEE"
                    let dayOfWeekString = dateFormatter.stringFromDate(date)
                    
                    let currentDay              =  dayOfWeekString 
                    
                    let currentDayHighTemp      =  Int( resultDict["temp_f"] as! Float)
                    
                    let currentDayLowTemp       =  Int( resultDict["dewpoint_f"] as! Float)
                    
                    let currentIcon             =   resultDict["icon"] as! String
                    
                    let currentIconType         =   resultDict["weather"] as! String
      
                    let  tempObj = CurrentTemperature(currentLocation: currentLocation, currentTemperatureInF: currentTemperatureInF, currentDay: currentDay, currentDayHighTemp: currentDayHighTemp, currentDayLowTemp: currentDayLowTemp, currentIcon: currentIcon, currentIconType: currentIconType) 
                
            
                    NSNotificationCenter.defaultCenter().postNotificationName("curretTempNotification", object:tempObj)
                
                } catch let error as NSError {
                    
                    print("error processing json data: \(error.localizedDescription)")
                    
                }
 
            }
                
            else{
                
                print("Error details:: \(error!.localizedDescription)")
                
            }
            
        })
        
        task.resume()
        
        
        //Get the hourly temperature
        
        var hourTemperatureArray = [HourlyTemperatures]()
  
       // let hourlyTempUrl:String = "https://api.myjson.com/bins/2eesa"
        
       let hourlyTempUrl:String = (hourTemp as String) + state + "/" + locality + ".json"
        
        let hourlyTempurl = NSURL(string: hourlyTempUrl)!
        
        let hourlyTask = NSURLSession.sharedSession().dataTaskWithURL(hourlyTempurl, completionHandler:{(hourlyData, response1, hourlyerror) -> Void in
     
            
            if(hourlyerror == nil){
                
                do {
                    
                    let hourlyTempDict = try NSJSONSerialization.JSONObjectWithData(hourlyData!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
                    
                    
                    
                    //print("Current Weather Conditions::",currentTempDict)
                    
                    
                    
                    let hourly_forecastDict = hourlyTempDict?.objectForKey("hourly_forecast") as! [AnyObject]!
                    
                    
                    
                    // print("result Hourly Dictionary::",hourly_forecastDict)
                    
                    
                    
                    for i in hourly_forecastDict{
   
                        let hourlyTemperatureInF = Int(i["temp"]!!["english"] as! String)
                        
                        let hourlyTime           = i["FCTTIME"]!!["civil"] as! String
                        
                        let hourlyIcon           = i["icon"] as! String
                        
                        let hourlyAmPm           = i["FCTTIME"]!!["ampm"] as! String
                    
                      
                        
                        hourTemperatureArray.append(HourlyTemperatures(hourlyTemperatureInF: hourlyTemperatureInF!, hourlyTime: hourlyTime.stringByReplacingOccurrencesOfString(":00 ", withString: ""), hourlyIcon: hourlyIcon, hourlyAmPm: hourlyAmPm))
                    }
                    
                    NSNotificationCenter.defaultCenter().postNotificationName("hourlyTempNotification", object: hourTemperatureArray)
                    
                } catch let error as NSError {
                    
                    print("error processing json data: \(error.localizedDescription)")
                    
                }
         
            }
                
            else{
                
                //                NSNotificationCenter.defaultCenter().postNotificationName("TestNotification", object: Int(1))
                
            print("Error details:: \(hourlyerror!.localizedDescription)")
                
            }
 
        })
        
        hourlyTask.resume()

        //fore Cast temp servie call
        
        var foreCastTempArray = [ForeCastTemperatures]()
//        
        //let foreCastTempUrl:String = "https://api.myjson.com/bins/2gjy2"
     
         let foreCastTempUrl:String = (tenDayTemp as String) + state + "/" + locality + ".json"
        
        let foreCasturl = NSURL(string: foreCastTempUrl)

        let foreCasttask = NSURLSession.sharedSession().dataTaskWithURL(foreCasturl!, completionHandler:{(forecastdata, response2, error2) -> Void in
      
            if(error2 == nil){
                
                do {
                    
                    let foreCastTempDict = try NSJSONSerialization.JSONObjectWithData(forecastdata!, options: NSJSONReadingOptions.MutableContainers) as?NSDictionary
                    
                    
                    
                    //print("Fore Cast Weather Conditions::",foreCastTempDict)
                    
                    
                    
                    let forecast = foreCastTempDict!.objectForKey("forecast")?["simpleforecast"]!!["forecastday"] as! [AnyObject]!
                    
                    
                    
                    //print("result forecast ten day  Dictionary::",forecast)
                    
                    
                    
                    for i in forecast{
        
                        let foreCastDay                   = i["date"]!!["weekday"] as! String
                        
                        let foreCastHighTempInF           = Int( i["high"]!!["fahrenheit"] as! String)
                        
                        let foreCastLowTempInF            = Int( i["low"]!!["fahrenheit"] as! String)
                        
                        let foreCastIcon                  = i["icon"] as! String
                        
                        
                        
                        
                        
                        let foreCastTempObj = ForeCastTemperatures(foreCastDay: foreCastDay, foreCastHighTempInF: foreCastHighTempInF!, foreCastLowTempInF: foreCastLowTempInF!, foreCastIcon: foreCastIcon) as ForeCastTemperatures
                        
                        
                        
                        foreCastTempArray.append(foreCastTempObj)
                        
                        
                    }
                    
                     NSNotificationCenter.defaultCenter().postNotificationName("forecastTempNotification", object: foreCastTempArray)
                    
                    
                    
                } catch let error as NSError {
                    
                    print("error processing json data: \(error.localizedDescription)")
                    
                }
                
                
                
            }
                
            else{
                
                print("Error details:: \(error2!.localizedDescription)")
                
            }
            
            
            
        })
        
        foreCasttask.resume()
        

        
        
    }
    

}

