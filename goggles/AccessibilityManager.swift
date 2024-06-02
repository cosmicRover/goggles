//
//  AccessibilityPermissionStatus.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Combine
import SwiftUI
import os.log

class AccessibilityManager: ObservableObject {
    @Published var isAccessEnabled: Bool = false {
        didSet{
            if isAccessEnabled {
                os_log("Accessibility access ENABLED", log: OSLog.application, type: .info)
                DispatchQueue.global(qos: .background).async {
                    ShortcutsManager.shared.startRegisteringShortcuts()
                }
            } else{
                os_log("Accessibility access DISABLED", log: OSLog.application, type: .info)
            }
        }
    }
    
    init() {
        updateAccessStatus()
    }
    
    func updateAccessStatus(willDisplayAccessibilityPrompt displayAccessibilityPrompt: Bool = false) {
        let trusted = kAXTrustedCheckOptionPrompt.takeRetainedValue() as String
        let options = [trusted: false]
        self.isAccessEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary)
        
        if !isAccessEnabled || displayAccessibilityPrompt{
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
