//
//  KBAViewController.swift
//  KeyboardAdjustable
//
//  Created by Ryan Demo on 10/25/16.
//  Copyright © 2016 RyanDemo. All rights reserved.
//

import UIKit

/// A class conforming to `KeyboardAdjustable`.
///
/// Can be subclassed to mask `KeyboardAdjustable` as in `Examples/CustomKBAViewController`.
/// If overriding `viewWillAppear` or `viewWillDisappear` in a subclass of `KBAViewController`, make sure to call their `super`s in the override.
open class KBAViewController: UIViewController {
    
    public var keyboardStatus: KeyboardStatus = .hidden
    
    /// Block to execute when moving the view up to a software keyboard active state.
    open var adjustViewForKeyboard: (CGFloat) -> Void = { height in
        // Code to move the view up to accomodate a keyboard
    }
    
    /// Block to execute when moving the view down to a hidden keyboard state.
    open var adjustViewForNoKeyboard: () -> Void = {
        // Code to move the view down for no keyboard
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterKeyboardNotifications()
    }

}

/// Conformance to `KeyboardAdjustable`.
extension KBAViewController: KeyboardAdjustable {
    
    public func keyboardWillChange(_ notification: Notification) {
        handleKeyboardChange(with: notification, moveViewUp: adjustViewForKeyboard, moveViewDown: adjustViewForNoKeyboard)
    }
    
}
