//
//  KeyboardAdjustable.swift
//  KeyboardAdjustable
//
//  Created by Ryan Demo on 10/25/16.
//  Copyright © 2016 RyanDemo. All rights reserved.
//

import Foundation

/// Protocol for view controllers to easily handle keyboard frame changes.
@objc public protocol KeyboardAdjustable {
    
    /// Current status of the keyboard.
    var keyboardStatus: KeyboardStatus { get set }
    
    /// Called when the keyboard will change frames. Implement `handleKeyboardChange` here.
    ///
    /// - parameter notification: the `UIKeyboardWillChangeFrame` notification registered with `registerKeyboardNotifications()`.
    func keyboardWillChange(_ notification: Notification)
    
}

/// Default implementations for an adjustable keyboard.
///
/// Both `KeyboardAdjustable` and `KeyboardStatus` are `@objc` so that `extension KeyboardAdjustable` can use selectors.
extension KeyboardAdjustable {
    
    /// Register a view controller to receive keyboard notifications.
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(Self.keyboardWillChange(_:)), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    /// Deregister a view controller from receiving keyboard notifications.
    func deregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    /// Convenience method that handles keyboard states and calls `moveViewUp` and `moveViewDown` appropriately.
    /// The implementing view calls its UI adjustment code in these blocks.
    ///
    /// - parameter notification: the keyboard notification to extract information from
    /// - parameter moveViewUp:   code block to call to move the view up to accomodate a keyboard
    /// - parameter moveViewDown: code block to call to move the view down to its pre-keyboard-visible state
    func handleKeyboardChange(with notification: Notification, moveViewUp: (_ height: CGFloat) -> Void, moveViewDown: () -> Void) {
        notification.keyboardType(
            software: { (height) in
                
                switch keyboardStatus {
                case .hidden, .hardwareActive:
                    moveViewUp(height)
                case .softwareActive:
                    break
                }
                self.keyboardStatus = .softwareActive
                
            },
            
            hardware: { (height) in
                switch keyboardStatus {
                case .hidden, .hardwareActive:
                    break
                case .softwareActive:
                    moveViewDown()
                }
                self.keyboardStatus = .hardwareActive
                
        })
    }
    
}
