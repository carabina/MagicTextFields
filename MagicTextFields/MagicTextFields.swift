//
//  MagicTextFields.swift
//  MagicTextFields
//
//  Created by Felipe Ricieri on 18/10/17.
//  Copyright © 2017 Ricieri ME. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Magic TextField -
// This class will help to handle
// textfield commodities such as
// jump from one to another
// and mask results based on
// generic values.
open class MagicTextfields {
    
    static var currentTextField:UITextField?
    
    open class func textFieldDidBeginEditing(_ textField: UITextField){
        currentTextField = textField
    }
    
    open class func textFieldDidEndEditing(){
        currentTextField?.endEditing(true)
    }
    
    // Based on the order
    // of the given array, try to
    // handle the jump order of
    // textfields
    open class func handleReturn(_ textfield:UITextField, order textfields:[UITextField?]) {
        
        // Get index for given textfield
        let easyArray = textfields as NSArray
        let index = easyArray.index(of: textfield)
        
        // Get next textfield
        // if it exists
        if index < (easyArray.count - 1) {
            
            // Get next textfield
            let nextTextfield = easyArray[index + 1] as! UITextField
            nextTextfield.becomeFirstResponder()
        }
            // It's the last item of
            // the array. So just resign
            // it as! first responder
        else {
            textfield.resignFirstResponder()
        }
    }
    
    // Handle for Masks
    open class func unformattedFrom(_ string: NSString, total: Int) -> NSString {
        var formatted = stripHashes(string)
        let length = formatted.length
        if length > total {
            formatted = formatted.substring(from: length-total) as NSString
        }
        return formatted
    }
    
    open class func realLengthOf(_ string: NSString) -> Int {
        return stripHashes(string).length
    }
    
    open class func stripHashes(_ str: NSString) -> NSString {
        var string = str
        string = string.replacingOccurrences(of: "(", with: "") as NSString
        string = string.replacingOccurrences(of: ")", with: "") as NSString
        string = string.replacingOccurrences(of: " ", with: "") as NSString
        string = string.replacingOccurrences(of: "-", with: "") as NSString
        string = string.replacingOccurrences(of: "+", with: "") as NSString
        string = string.replacingOccurrences(of: "/", with: "") as NSString
        return string
    }
    
    // Helper that will apply the
    // accessory view given to the right
    // textfield based on the list of
    // enabled textfields
    class func applyAccessoryViewTo(_ textfield:UITextField, enableOnTextFields:[UITextField?], accessoryView:UIView) {
        
        // Get index for given textfield
        let easyArray = enableOnTextFields as NSArray
        let index = easyArray.index(of: textfield)
        
        // Get next textfield
        // if it exists
        if index != NSNotFound {
            
            // apply the view
            textfield.inputAccessoryView = accessoryView
        }
    }
}

