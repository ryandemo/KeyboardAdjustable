//
//  KeyboardStatus.swift
//  KeyboardAdjustable
//
//  Created by Ryan Demo on 10/25/16.
//  Copyright © 2016 RyanDemo. All rights reserved.
//

import Foundation

/// Enumeration of possible keyboard statues.
///
/// - hidden:         keyboard not shown
/// - hardwareActive: hardware keyboard is active and not shown on screen
/// - softwareActive: software keyboard is active and shown
@objc public enum KeyboardStatus: Int {
    case hidden = 0
    case hardwareActive = 1
    case softwareActive = 2
}
