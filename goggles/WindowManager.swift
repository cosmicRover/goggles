//
//  WindowManager.swift
//  goggles
//
//  Created by Joy Paul on 5/23/24.
//

import Cocoa
import ApplicationServices
import os.log

struct WindowManager {
    static func handleWindowResizeOperationFor(position: ResizePosition) {
        let firstWindow: AXUIElement? = self.getFirstFocusedWindow()
        
        if let firstWindow = firstWindow {
            resizeFirstWindowTo(firstWindow: firstWindow, position: position)
        }
    }
    
    private static func getFirstFocusedWindow() -> AXUIElement? {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        let accessEnabled = AXIsProcessTrustedWithOptions(options)
        
        guard accessEnabled else {
            os_log("Accessibility access not enabled", log: OSLog.application, type: .error)
            NSSound.beep()
            return nil
        }
        
        guard let app = NSWorkspace.shared.frontmostApplication else {
            os_log("No frontmost application found", log: OSLog.application, type: .error)
            NSSound.beep()
            return nil
        }
        
        let appElement = AXUIElementCreateApplication(app.processIdentifier)
        
        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(appElement, kAXWindowsAttribute as CFString, &value)
        
        guard result == .success, let windows = value as? [AXUIElement], !windows.isEmpty else {
            switch result {
            case .success:
                os_log("No windows found for the application", log: OSLog.application, type: .error)
            case .failure:
                os_log("Failed to retrieve windows, error: %@", log: OSLog.application, type: .error, "\(result)")
            default:
                os_log("Unhandled error for: ", log: OSLog.application, type: .error, "\(result)")
            }
            
            NSSound.beep()
            return nil
        }
        
        return windows.first
    }
    
    private static func resizeFirstWindowTo(firstWindow: AXUIElement, position: ResizePosition){
        guard var windowPositionAndSize = DisplayCalculationManager.getWindowPositionAndSize(for: position) else {
            NSSound.beep()
            return
        }
        
        let sizeValue: AXValue? = AXValueCreate(AXValueType.cgSize, &windowPositionAndSize.heightAndWidthCoordinates)
        let positionValue: AXValue? = AXValueCreate(AXValueType.cgPoint, &windowPositionAndSize.positionCoordinates)
        
        if let sizeValue = sizeValue, let positionValue = positionValue {
            let setSizeResult = AXUIElementSetAttributeValue(firstWindow, kAXSizeAttribute as CFString, sizeValue)
            
            if setSizeResult != .success {
                os_log("Failed to resize window, error: %@", log: OSLog.application, type: .error, "\(setSizeResult)")
                NSSound.beep()
            }
            
            let setPositionResult = AXUIElementSetAttributeValue(firstWindow, kAXPositionAttribute as CFString, positionValue)
            
            if setPositionResult != .success {
                os_log("Failed to position window, error: %@", log: OSLog.application, type: .error, "\(setPositionResult)")
                NSSound.beep()
            }
            
        } else {
            os_log("Failed to create AXValues", log: OSLog.application, type: .error)
            NSSound.beep()
        }
    }
}
