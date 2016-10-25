//
//  Notification+Keyboard.swift
//  KeyboardAdjustable
//
//  Created by Ryan Demo on 10/25/16.
//  Copyright © 2016 RyanDemo. All rights reserved.
//

import Foundation

extension Notification {
    
    /// Determine the if the keyboard is a software or hardware keyboard from a `UIKeyboard` notification.
    ///
    /// Meant to be used with `UIKeyboardWillChangeFrame`.
    ///
    /// - parameter software: block to execute if the keyboard will be a software keyboard
    /// - parameter hardware: block to execute if the keyboard will be a hardware keyboard
    /// - parameter keyboardHeight: height of the keyboard frame after the animation
    func keyboardType(software: (_ keyboardHeight: CGFloat) -> Void, hardware: (_ keyboardHeight: CGFloat) -> Void) {
        if let keyboardSize = (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let height = UIScreen.main.bounds.size.height - keyboardSize.origin.y
            
            // 160 is minimum height of the software keyboard on non-retina iPhone in landscape mode
            height >= 160 ? software(height) : hardware(height)
        }
    }
    
}
