//
//  SecondViewController.swift
//  Project 07
//
//  Created by SHiRoMe9 on 08/04/2017.
//  Copyright © 2017 SHiRoMe9. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    var textPass : String = ""
    
    @IBOutlet weak var detailText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Second View"
        detailText?.text = textPass
        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .camera,
            target: self,
            action: #selector (addPhoto)
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
    
    // Starting chose the Photo and show it up yo
    
    func addPhoto () {
        let chosePhoto = UIImagePickerController()
        chosePhoto.delegate = self
        chosePhoto.allowsEditing = false
        chosePhoto.sourceType = .photoLibrary
        chosePhoto.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        
        present(chosePhoto, animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // if We get Photo on PhotoLibrary And there is not nil
        
        if let choseImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let attributedString = NSMutableAttributedString()
            
            // Get the originalText to the attributeString
            
            if let originalText = detailText.attributedText {
                attributedString.append(originalText)
            }
            
            let textAttachment = NSTextAttachment()
            let originalWidth = choseImage.size.width
            let scaleFactor = originalWidth / detailText.frame.size.width
            
            textAttachment.image = UIImage(cgImage: choseImage.cgImage!, scale: scaleFactor, orientation: .up)
            
            attributedString.append(NSAttributedString(attachment: textAttachment))
            
            detailText.attributedText = attributedString
            
            dismiss(animated: true, completion: nil)

            
        }
   
    
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // Chose Phote end
    
    
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
