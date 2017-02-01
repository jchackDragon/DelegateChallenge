//
//  ViewController.swift
//  DelegateChallenge
//
//  Created by Juan Carlos Lopez on 10/7/16.
//  Copyright © 2016 Juan Carlos Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextView: UITextField!
    @IBOutlet weak var dolarsTextView: UITextField!
    @IBOutlet weak var lockedTextView: UITextField!
    @IBOutlet weak var onLockSwich: UISwitch!
    
    //Delegates
    let ZipCodeDelegate = ZipCodeTextViewDelegate()
    let CashDeletate = CashTextFieldDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set Delegate
        self.zipCodeTextView.delegate = ZipCodeDelegate
        self.dolarsTextView.delegate = CashDeletate
        self.lockedTextView.delegate = self
        
        self.onLockSwich.setOn(false, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.onLockSwich.isOn
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    

    
    @IBAction func TogleValueSwitch(_ sender: AnyObject) {
        
        if !(sender as! UISwitch).isOn{
            self.lockedTextView.resignFirstResponder()
        }
    }
  
}

