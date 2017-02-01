//
//  ZipCodeTextViewDelegate.swift
//  DelegateChallenge
//
//  Created by Juan Carlos Lopez on 10/7/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextViewDelegate:NSObject, UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
       let oldString = textField.text as! NSString
       let newString = oldString.replacingCharacters(in: range, with: string) as NSString
        
       return newString.length <= 5
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
 
    
   
}
