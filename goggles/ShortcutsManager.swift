//
//  ShortcutsManager.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Cocoa
import os.log

class ShortcutsManager{
    static let shared = ShortcutsManager()
    
    private init() {}
    
    var monitors: [HandledKeyCodes: Any] = [:]
    
    func startRegisteringShortcuts(){
        for keyCode in HandledKeyCodes.allCases{
            registerShortcut(forKey: keyCode)
        }
    }
    
    func stopRegisteringShortcuts(){
        unRegisterAllShortcuts()
    }
    
    private func registerShortcut(forKey keyCode: HandledKeyCodes) {
        if monitors[keyCode] != nil{ return }
        
        let newMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.keyDown]) { event in
            if event.keyCode == keyCode.rawValue && event.modifierFlags.contains(.command) && event.modifierFlags.contains(.option) {
                
                os_log("Command + Option + %@ pressed", log: OSLog.application, type: .info, "\(keyCode)")
                
                switch event.keyCode {
                case HandledKeyCodes.leftArrow.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .horizontaLeft)
                    
                case HandledKeyCodes.rightArrow.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .horizontalRight)
                    
                default:
                    break
                }
            }
        }
        
        monitors[keyCode] = newMonitor
        os_log("Registered monitor: %@", log: OSLog.application, type: .info, "\(keyCode)")
    }
    
    private func unRegisterAllShortcuts(){
        for (keyCode, existingMonitor) in monitors{
            NSEvent.removeMonitor(existingMonitor)
            monitors.removeValue(forKey: keyCode)
            os_log("Unregistered monitor: %@", log: OSLog.application, type: .info, "\(keyCode)")
        }
    }
}
