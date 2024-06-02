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
    
    private var monitors: [HandledKeyCodes: Any] = [:]
    
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
            if event.keyCode == keyCode.rawValue && event.modifierFlags.contains(.command) && event.modifierFlags.contains(.option) && event.modifierFlags.contains(.control) {
                
                os_log("Control + Command + Option + %@ pressed", log: OSLog.application, type: .info, "\(keyCode)")
                
                switch event.keyCode {
                case HandledKeyCodes.leftArrow.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .horizontaLeft)
                    
                case HandledKeyCodes.rightArrow.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .horizontalRight)
                    
                case HandledKeyCodes.upArrow.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .verticalTop)
                    
                case HandledKeyCodes.bottomArrow.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .verticalBottom)
                    
                case HandledKeyCodes.keyF.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .fullscreen)
                    
                case HandledKeyCodes.keyA.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .HorizontalLeftOneThird)
                    
                case HandledKeyCodes.keyS.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .HorizontalLeftTwoThird)
                    
                case HandledKeyCodes.keyApostrophe.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .HorizontalRightOneThird)
                    
                case HandledKeyCodes.keySemicolon.rawValue:
                    WindowManager.handleWindowResizeOperationFor(position: .HorizontalRightTwoThird)

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
