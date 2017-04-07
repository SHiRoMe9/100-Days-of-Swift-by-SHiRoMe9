//
//  ViewController.swift
//  Project 04
//
//  Created by SHiRoMe9 on 06/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    
    //Display
    
    @IBOutlet weak var moneyOrder: UITextField!
    
    @IBOutlet weak var tipRate: UILabel!
    @IBOutlet weak var tipsMoney: UILabel!
    @IBOutlet weak var totalPay: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var sliderRate: UISlider!
    
    // set up value
    
    var money : Float = 0.00
    var rate : Float = 0.15
    var tipCalulator = TipCalculator()
    
  
    @IBAction func controlRate(_ sender: UISlider) {
        
//        print ((sender.value * 100 ) / 100)
//        print (round(sender.value * 100) / 100)
        self.rate = round(sender.value * 100) / 100
        
      
        self.countIt()
    }
    
    
    func addDoneButton() {
        let barButtonFlex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButtonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.processInputMoney))
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.items = [ barButtonFlex, barButtonDone ]
        keyboardToolbar.sizeToFit()
        moneyOrder.inputAccessoryView = keyboardToolbar
    }
    
    func processInputMoney() {
        // End editing
        moneyOrder.endEditing(true)
        
        if let stringAmount = moneyOrder.text {
            self.money = (stringAmount as NSString).floatValue
        }
        else {
            self.money = 0
        }
        
        moneyOrder.text = String(format: "$%0.2f", self.money)
        countIt()
    }

    
    
    func countIt () {
        //let tips = tipCalculator(rate : rate , money : moneyOrder)
        let tipMoney = tipCalulator.tipCount(rate: self.rate, money :self.money)
        let totalMoney = tipCalulator.totalCount(rate: self.rate, money :self.money)
        
        tipRate.text = String(format: "Tip (%.0f%%):", self.rate * 100 )
        tipsMoney.text =  String(format: "$%.2f%" , tipMoney)
        totalPay.text = String(format:"$%.2f%", totalMoney)
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Change the input to decimal pad
        moneyOrder.keyboardType = UIKeyboardType.decimalPad
        
        // Add "Done" to the keypad
        addDoneButton()
        
        sliderRate.value = self.rate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

