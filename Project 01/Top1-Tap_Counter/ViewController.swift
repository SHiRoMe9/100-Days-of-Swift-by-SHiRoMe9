//
//  ViewController.swift
//  Top1-Tap_Counter
//
//  Created by SHiRoMe9 on 11/2/16.
//  Copyright © 2016 SHiRoMe9. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    private var brain = CounterBrain()
    
    @IBAction func touchTap(_ sender: UIButton) {
        brain.addCounter(operand :1)
        display.text! = String(brain.result)
        
    }

    
    
    
    @IBAction func touchRest(_ sender:UIButton) {
        brain.restCounter(operand: 0)
        display.text! = String(brain.result)
        
        
    }
    
    
    
}

