//
//  KeyBoardIssue.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 18/11/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

// defining some dummy variables

class DummyView: UIViewController {
    var topTextField: UITextField!
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    @objc func keyborardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    // Mark: below is the previous implementation
    
    @objc func keyborardWillShowOld(_ notification: Notification) {
        if topTextField.isEditing {
            keyborardWillHide(notification)
        } else {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    // Mark: the below is the suggessted implementation
    
    @objc func keyborardWillShowNew(_ notification: Notification) {
        if topTextField.isEditing {
            view.frame.origin.y = 0
        } else {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    //Mark: the above implementations looks the same, no differences.
}
