//
//  MemeMeTextFieldDelegate.swift
//  MemeMe
//
//  Created by Ronald Morgan on 5/30/16.
//  Copyright © 2016 Ronald Morgan. All rights reserved.
//

import Foundation
import UIKit


class MemeMeTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField.text! == "BOTTOM" || textField.text! == "TOP"){
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
