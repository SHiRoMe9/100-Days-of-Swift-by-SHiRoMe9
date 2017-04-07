//
//  tipCalculator.swift
//  Project 04
//
//  Created by SHiRoMe9 on 06/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import Foundation


class TipCalculator
{
    
    func tipCount (rate : Float, money : Float ) -> Float {
        
        return money * rate
    }
    
    func totalCount ( rate : Float , money : Float) -> Float{
        return money * ( 1 + rate )
    }
    
}
