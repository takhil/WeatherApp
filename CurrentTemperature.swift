//
//  CurrentTemperature.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/16/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import Foundation


class CurrentTemperature: NSObject {
    
    var currentLocation:String!
    var currentTemperatureInF:Int!
    var currentDay:String!
    var currentDayHighTemp:Int!
    var currentDayLowTemp:Int!
    var currentIcon:String!
    var currentIconType:String!
    
    init(currentLocation:String,currentTemperatureInF:Int,currentDay:String,currentDayHighTemp:Int,currentDayLowTemp:Int,currentIcon:String,currentIconType:String){
        
        
        self.currentLocation        = currentLocation
        self.currentTemperatureInF  = currentTemperatureInF
        self.currentDay             = currentDay
        self.currentDayHighTemp     = currentDayHighTemp
        self.currentDayLowTemp      = currentDayLowTemp
        self.currentIcon            = currentIcon
        self.currentIconType        = currentIconType
        
        
    }
    
}
