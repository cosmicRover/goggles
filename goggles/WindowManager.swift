//
//  WindowManager.swift
//  goggles
//
//  Created by Joy Paul on 5/23/24.
//

import Cocoa
import ApplicationServices

struct WindowManager {
    func handleWindowResizeOperationFor(position: ResizePosition) {
        let firstWindow: AXUIElement? = self.getFirstFocusedWindow()
        
        if let firstWindow = firstWindow {
            resizeFirstWindowTo(firstWindow: firstWindow, position: position)
        }
    }
    
    private func getFirstFocusedWindow() -> AXUIElement? {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        let accessEnabled = AXIsProcessTrustedWithOptions(options)
        
        guard accessEnabled else {
            print("Accessibility permissions are not enabled.")
            NSSound.beep()
            return nil
        }
        
        guard let app = NSWorkspace.shared.frontmostApplication else {
            print("No frontmost application found.")
            NSSound.beep()
            return nil
        }
        
        let appElement = AXUIElementCreateApplication(app.processIdentifier)
        
        var value: CFTypeRef?
        let result = AXUIElementCopyAttributeValue(appElement, kAXWindowsAttribute as CFString, &value)
        
        guard result == .success, let windows = value as? [AXUIElement], !windows.isEmpty else {
            if result == .success {
                print("No windows found for the application.")
            } else {
                print("Failed to retrieve windows, error: \(result)")
            }
            
            NSSound.beep()
            return nil
        }
        
        return windows.first
    }
    
    private func resizeFirstWindowTo(firstWindow: AXUIElement, position: ResizePosition){
        //TODO: incorporate display calculations struct into this function
        
        var newSize = CGSize(width: 800, height: 800) // Desired size
        var sizeValue: AXValue?
        var positionValue: AXValue?
        
        var newOrigin = CGPoint(x: 0, y: 0)
        positionValue = AXValueCreate(AXValueType.cgPoint, &newOrigin)
        sizeValue = AXValueCreate(AXValueType.cgSize, &newSize)
        
        if let sizeValue = sizeValue, let positionValue = positionValue {
            let setSizeResult = AXUIElementSetAttributeValue(firstWindow, kAXSizeAttribute as CFString, sizeValue)
            
            if setSizeResult != .success {
                print("Failed to resize window, error: \(setSizeResult)")
                NSSound.beep()
            }
            
            let positionResult = AXUIElementSetAttributeValue(firstWindow, kAXPositionAttribute as CFString, positionValue)
            
            if positionResult != .success {
                print("Failed to position window, error: \(positionResult)")
                NSSound.beep()
            }
            
        } else {
            print("Failed to create AXValue for size.")
            NSSound.beep()
        }
        
    }
}
