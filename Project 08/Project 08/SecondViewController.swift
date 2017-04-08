//
//  SecondViewController.swift
//  Project 07
//
//  Created by SHiRoMe9 on 08/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var textPass : String = ""
    
    @IBOutlet weak var detailText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Second View"
        detailText?.text = textPass
        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: nil
        )
        
        // register gesture
        
        let gestureSwipUp = UISwipeGestureRecognizer(
            target: self,
            action: #selector(swipeGesture(_:))
        )
        gestureSwipUp.direction = .up
        detailText.addGestureRecognizer(gestureSwipUp)
        
        let gestureSwipDown = UISwipeGestureRecognizer(
            target: self,
            action: #selector(swipeGesture(_:))
        )
        gestureSwipDown.direction = .down
        detailText.addGestureRecognizer(gestureSwipDown)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeGesture (_ gesture : UIGestureRecognizer ) {
        if let swipeGo = gesture as? UISwipeGestureRecognizer {
            switch swipeGo.direction {
                case UISwipeGestureRecognizerDirection.up :
                    detailText.becomeFirstResponder()
                
                case UISwipeGestureRecognizerDirection.down :
                    detailText.endEditing(true)
                
                
                default:
                    break
                
            }
            
            
        }
        
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
