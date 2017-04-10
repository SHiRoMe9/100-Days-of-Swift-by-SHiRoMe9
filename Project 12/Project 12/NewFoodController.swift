//
//  NewFoodController.swift
//  Project 12
//
//  Created by SHiRoMe9 on 10/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class NewFoodController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var newFoodText: UITextView!
    
    weak var delegate : FoodListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Food yo~"
        
        newFoodText.becomeFirstResponder()
        newFoodText.returnKeyType = .done
        newFoodText.text = ""
        newFoodText.delegate = self
        
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            
            newFoodText.endEditing(true)
            
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if newFoodText.text.characters.count > 0 {
            
            if let update = delegate {
                update.updateList(name: newFoodText.text)
            }
        }
        // Return to previous view
        _ = self.navigationController?.popViewController(animated: true)
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
