//
//  CustomKBAViewController.swift
//  KeyboardAdjustable
//
//  Created by Ryan Demo on 10/25/16.
//  Copyright © 2016 RyanDemo. All rights reserved.
//

import Foundation

/// Example keyboard adjustable view controller.
///
/// In such a subclass of `KBAViewController`, it is only necesasry to override `moveToViewWithKeyboard` and `moveToViewWithoutKeyboard`.
class CustomKBAViewController: KBAViewController {
    
    override func viewDidLoad() {
        setUpKeyboardHandler()
    }
    
    func setUpKeyboardHandler() {
        
        super.adjustViewForKeyboard = { height in
            // Code to move the view up to accomodate a keyboard
        }
        
        super.adjustViewForNoKeyboard = {
            // Code to move the view down for no keyboard
        }
        
    }
    
}
