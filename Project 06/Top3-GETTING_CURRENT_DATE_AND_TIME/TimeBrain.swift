//
//  timeBrain.swift
//  Top3-GETTING_CURRENT_DATE_AND_TIME
//
//  Created by SHiRoMe9 on 11/6/16.
//  Copyright © 2016 SHiRoMe9. All rights reserved.
//

import Foundation


class TimeBrain {
    
    
    
    
    var datePring : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        
        dateFormatter.locale = Locale(identifier: "en_US")
        
        
        let date = NSDate()
        
        
        return dateFormatter.string(from: date as Date)
        
    }
    
        
    
    
    
}


