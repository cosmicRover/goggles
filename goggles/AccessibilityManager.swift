//
//  AccessibilityPermissionStatus.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Combine
import SwiftUI

class AccessibilityManager: ObservableObject {
    @Published var isAccessEnabled: Bool = false {
        didSet{
            if isAccessEnabled {
                print("ACCESS ENABLED")
                DispatchQueue.global(qos: .background).async {
                    ShortcutsManager.shared.startRegisteringShortcuts()
                }
            }
        }
    }
    
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
    
    private func promptForAccessibilityPermission() {
        DispatchQueue.main.async {
            let alert = NSAlert()
            alert.messageText = "Accessibility Permission Needed"
            alert.informativeText = "Goggles needs accessibility permission to respond to keyboard shortcuts. Quit and reopen the app after granting it."
            alert.addButton(withTitle: "Open Accessibility Settings")
            alert.addButton(withTitle: "Cancel")
            let response = alert.runModal()
            if response == .alertFirstButtonReturn {
                self.openSystemPreferencesAccessibility()
            }
        }
    }
    
    private func openSystemPreferencesAccessibility() {
        if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
            NSWorkspace.shared.open(url)
        }
    }
}
