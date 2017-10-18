//
//  MagicTextFieldsMasks.swift
//  MagicTextFields
//
//  Created by Felipe Ricieri on 18/10/17.
//  Copyright © 2017 Ricieri ME. All rights reserved.
//

import Foundation
import UIKit

public extension MagicTextfields {
    
    // MARK: - ☎️ Phone
    class func maskForPhone(_ textField: UITextField, range: NSRange) -> Bool {
        var fieldText = textField.text!
        let length = MagicTextfields.realLengthOf(fieldText as NSString)
        let total = 11
        if length == total {
            //textField.text! = ""
            if range.length == 0 {
                return false
            }
        }
        
        let num = MagicTextfields.unformattedFrom(fieldText as NSString, total: total)
        // XX
        if length == 2 {
            fieldText = "(\(num)) "
            if range.length > 0 {
                fieldText = num.substring(to: 2)
            }
            textField.text! = fieldText
        }
        // XX YYYY-
        else if length == 6 {
            fieldText = "(\(num.substring(to: 2))) \(num.substring(from: 2))-"
            if range.length > 0 {
                fieldText = "(\(num.substring(to: 2))) \(num.substring(from: 2))"
            }
            textField.text! = fieldText
        }
        // XX YYYY-ZZZZ
        else if length == 10 {
            fieldText = "(\(num.substring(to: 2))) \(num.substring(with: NSMakeRange(2, 5)))-\(num.substring(from: 7))"
            if range.length > 0 {
                fieldText = "(\(num.substring(to: 2))) \(num.substring(with: NSMakeRange(2, 4)))-\(num.substring(from: 6))"
            }
            textField.text! = fieldText
        }
        
        return true
    }
    
    // MARK: - 📆 Date
    class func maskForDate(_ textField: UITextField, range: NSRange) -> Bool {
        var fieldText = textField.text!
        let length = MagicTextfields.realLengthOf(fieldText as NSString)
        let total = 8
        if length == total {
            if range.length == 0 {
                return false
            }
        }
        let num = MagicTextfields.unformattedFrom(fieldText as NSString, total: total)
        // XX
        if length == 2 {
            fieldText = "\(num)/"
            if range.length > 0 {
                fieldText = num.substring(to: 2)
            }
            textField.text! = fieldText
        }
        // XX/MM
        else if length == 4 {
            fieldText = "\(num.substring(to: 2))/\(num.substring(from: 2))/"
            if range.length > 0 {
                fieldText = "\(num.substring(to: 2))/\(num.substring(from: 2))"
            }
            textField.text! = fieldText
        }
        return true
    }
}

