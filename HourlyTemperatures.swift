//
//  HourlyTemperatures.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/17/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import Foundation


class HourlyTemperatures: NSObject {
    
  
    var hourlyTemperatureInF:Int!
    var hourlyTime:String!
    var hourlyIcon:String!
    var hourlyAmPm:String!
    var displayHour:String!
    
    
    init(hourlyTemperatureInF:Int,hourlyTime:String,hourlyIcon:String,hourlyAmPm:String){
        
        
        self.hourlyTemperatureInF        = hourlyTemperatureInF
        self.hourlyTime                  = hourlyTime 
        self.hourlyIcon                  = hourlyIcon
        self.hourlyAmPm                  = hourlyAmPm
       
        
        
    }
    
}
