//
//  ViewController.swift
//  Top3-GETTING_CURRENT_DATE_AND_TIME
//
//  Created by SHiRoMe9 on 11/6/16.
//  Copyright © 2016 SHiRoMe9. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        display.text! = timeBrain.datePring
        
    }
    
    /******
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     *****/
    
    let timeBrain = TimeBrain()
    
    @IBOutlet weak var display: UILabel!
    
    
    
    @IBAction func touchRefresh(_ sender: Any) {
        display.text! = timeBrain.datePring
        
    }
    
    
    
}

