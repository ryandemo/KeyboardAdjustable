//
//  KBAViewControllerNoBlocks.swift
//  KeyboardAdjustable
//
//  Created by Ryan Demo on 10/25/16.
//  Copyright © 2016 RyanDemo. All rights reserved.
//

import Foundation

/// An example class conforming to `KeyboardAdjustable`.
///
/// Use this template if you need more configurability than in a subclass of `KBAViewController`.
class KBAViewControllerNoBlocks: UIViewController {
    
    var keyboardStatus: KeyboardStatus = .hidden
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterKeyboardNotifications()
    }
    
}

/// Conformance to `KeyboardAdjustable`.
extension KBAViewControllerNoBlocks: KeyboardAdjustable {
    
    func keyboardWillChange(_ notification: Notification) {
        
        handleKeyboardChange(
            with: notification, moveViewUp: { (height) in
                
                // Code to move the view up to accomodate a keyboard
                
            }, moveViewDown: {
                
                // Code to move the view down for no keyboard
                
            }
        )
        
    }
    
}
