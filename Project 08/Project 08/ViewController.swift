//
//  ViewController.swift
//  Project 07
//
//  Created by SHiRoMe9 on 08/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    

    @IBOutlet weak var articleText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "First View"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(ViewController.test)
        )
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(sendToSencondView)
        )
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test (sender:Any?) {
        
        performSegue(withIdentifier: "Show Detail", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Show Detail" {
            if let ivc = segue.destination as? SecondViewController {
               
                if let textDetail = articleText?.text {
                    
                    ivc.textPass = textDetail
                    
                }
                
            }
            
        }
        
    } // prepare segue

   
  
}


//extension UIViewController
//{
//    var contentViewController : UIViewController {
//        if let navcon = self as? UINavigationController {
//            return navcon.visibleViewController ?? self
//        }
//        else {
//            return self
//        }
//        
//    }
//    
//    
//}

