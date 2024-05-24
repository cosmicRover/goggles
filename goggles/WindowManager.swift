//
//  WindowManager.swift
//  goggles
//
//  Created by Joy Paul on 5/23/24.
//

import Cocoa
import ApplicationServices

struct WindowManager {
    func handleWindowResizeOperation() {
        self.getFocusedApp()
    }
    
    private func getFocusedApp() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        let accessEnabled = AXIsProcessTrustedWithOptions(options)
        
        guard accessEnabled else {
            print("Accessibility permissions are not enabled.")
            return
        }
        
        guard let app = NSWorkspace.shared.frontmostApplication else {
            print("No frontmost application found.")
            return
        }
        
        let pid = app.processIdentifier
        let focusedApp = AXUIElementCreateApplication(pid)
        
        var focusedWindow: AnyObject?
        AXUIElementCopyAttributeValue(focusedApp, kAXTitleAttribute as CFString, &focusedWindow)
        
        debugPrint("RESULT is: \(focusedWindow)")
        
    }
}

