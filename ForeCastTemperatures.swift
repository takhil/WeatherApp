//
//  ForeCastTemperatures.swift
//  WeatherApp
//
//  Created by Akhil Tirumalasetty on 10/18/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import Foundation

class ForeCastTemperatures: NSObject {
    
    
    var foreCastDay:String!
    var foreCastHighTempInF:Int!
    var foreCastLowTempInF:Int!
    var foreCastIcon:String!
    
    
    
    init(foreCastDay:String,foreCastHighTempInF:Int,foreCastLowTempInF:Int,foreCastIcon:String){
        
        
        self.foreCastDay                         = foreCastDay
        self.foreCastHighTempInF                 = foreCastHighTempInF
        self.foreCastLowTempInF                  = foreCastLowTempInF
        self.foreCastIcon                        = foreCastIcon
        
        
        
    }
    
}
