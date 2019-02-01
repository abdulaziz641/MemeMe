//
//  appExtensions.swift
//  MemeMe
//
//  Created by Abdulaziz Alsaloum on 17/11/2018.
//  Copyright © 2018 Abdulaziz Alsaloum. All rights reserved.
//

import Foundation
import UIKit

extension MemeEditorVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    //Mark: UIImagePicker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        shareMemeButton.isEnabled = true
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //Mark: UITextField Delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        if topIsFirstAttempt || bottomIsFirstAttempt {
            if textField == topTextField && textField.text! == "TOP" {
                topIsFirstAttempt = false
                textField.text! = ""
            } else if textField == bottomTextField && textField.text! == "BOTTOM"{
                bottomIsFirstAttempt = false
                textField.text! = ""
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
