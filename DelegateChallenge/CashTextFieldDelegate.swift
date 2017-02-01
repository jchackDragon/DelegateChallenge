//
//  CashTextFieldDelegate.swift
//  DelegateChallenge
//
//  Created by Juan Carlos Lopez on 10/7/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldString = textField.text! as NSString
        var replesedString = oldString.replacingCharacters(in: range, with: string)
        var newString = String(replesedString)
        
        let digit = CharacterSet.decimalDigits
        var number = ""
        
        for c in (newString?.unicodeScalars)!{
            if(digit.contains(UnicodeScalar(c.value)!)){
                number.append(String(c))
            }
        }
        
        
        if let value = Int(number){
            textField.text = "$"+dolarFormatStringForInt(value:value)+"."+dolarcentFormatStringForInt(value:value)
        }
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField.text!.isEmpty){
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func dolarFormatStringForInt(value :Int) -> String{
        return String(value / 100)
    }
    
    func dolarcentFormatStringForInt(value :Int) -> String{
        let cents = Int(value % 100)
        
        if cents < 10{
            return "0" + String(cents)
        }else{
            return String(cents)
        }
    }
    
    
}
