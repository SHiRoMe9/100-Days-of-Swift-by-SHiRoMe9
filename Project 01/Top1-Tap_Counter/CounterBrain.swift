//
//  countBrain.swift
//  Top1-Tap_Counter
//
//  Created by SHiRoMe9 on 11/2/16.
//  Copyright © 2016 SHiRoMe9. All rights reserved.
//

import Foundation

protocol FullyNamed {
    var fullName: String { get }
    //func random() -> Double
}


protocol Togglable {
    mutating func toggle()
}

class CounterBrain {
    
    private var counter = 0
    
    
    
    func addCounter(operand : Int){
        
        counter = counter + operand
        
    }
    
    
    
    
    
    func restCounter(operand : Int){
        counter = operand
        
        class Starship: FullyNamed {
            var prefix: String?
            var name: String
            init(name: String, prefix: String? = nil) {
                self.name = name
                self.prefix = prefix
            }
            var fullName: String {
                return (prefix != nil ? prefix! + " " : "") + name
            }
        }
        let ncc1701 = Starship(name: "Enterprise")
        
        
        enum OnOffSwitch: Togglable {
            case off, on
            mutating func toggle() {
                switch self {
                case .off:
                    self = .on
                case .on:
                    self = .off
                }
            }
        }
        
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        
        //print(ncc1701.fullName)
        
        /*
         
         
         for thing in things {
         switch thing {
         case 0 as Int:
         print("zero as an Int")
         case 0 as Double:
         print("zero as a Double")
         /* case let someInt as Int:
         print("an integer value of \(someInt)")
         
         */
         case let someInt as? Int:
         print("an integer value of \(someInt!)")
         
         
         default:
         print("something else")
         }
         }
         */
        
        
    }
    
    var result : Int {
        
        return counter
        
        
        
    }
    
    
    
    
    
    
}
