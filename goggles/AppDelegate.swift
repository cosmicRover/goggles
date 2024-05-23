//
//  AppDelegates.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Foundation
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {    
    func applicationDidFinishLaunching(_ notification: Notification) {
        var accessibilityStatus = AccessibilityManager.shared
        
        
//        let trusted = kAXTrustedCheckOptionPrompt.takeRetainedValue() as String
//        let options = [trusted: true]
//        let accessEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary?)
//        
//        if !accessEnabled {
//            promptForAccessibilityPermission()
//        }
    }
    
//    func promptForAccessibilityPermission() {
//        let alert = NSAlert()
//        alert.messageText = "Accessibility Permission Needed"
//        alert.informativeText = "Goggles needs accessibility permissions to respond to keyboard shortcuts. Please grant permission in System Preferences."
//        alert.addButton(withTitle: "Open System Preferences")
//        alert.addButton(withTitle: "Cancel")
//        
//        let response = alert.runModal()
//        if response == .alertFirstButtonReturn {
//            openSystemPreferencesAccessibility()
//        }
//    }
//    
//    func openSystemPreferencesAccessibility() {
//        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
//            NSWorkspace.shared.open(url)
//        }
//    }
}
