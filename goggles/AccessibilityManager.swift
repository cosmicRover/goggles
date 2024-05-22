//
//  AccessibilityPermissionStatus.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Combine
import SwiftUI

class AccessibilityManager: ObservableObject {
    @Published var isAccessEnabled: Bool = false
    
    init() {
        updateAccessStatus()
    }
    
    func updateAccessStatus() {
        let trusted = kAXTrustedCheckOptionPrompt.takeRetainedValue() as String
        let options = [trusted: false]
        self.isAccessEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary)
        
        if !isAccessEnabled{
            promptForAccessibilityPermission()
        }
    }
    
    func promptForAccessibilityPermission() {
        let alert = NSAlert()
        alert.messageText = "Accessibility Permission Needed"
        alert.informativeText = "Goggles needs accessibility permissions to respond to keyboard shortcuts. Please grant permission in System Preferences."
        alert.addButton(withTitle: "Open System Preferences")
        alert.addButton(withTitle: "Cancel")
        
        let response = alert.runModal()
        if response == .alertFirstButtonReturn {
            openSystemPreferencesAccessibility()
        }
    }
    
    func openSystemPreferencesAccessibility() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
            NSWorkspace.shared.open(url)
        }
    }
}
