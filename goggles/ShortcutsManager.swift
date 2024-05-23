//
//  ShortcutsManager.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Cocoa

class ShortcutsManager{
    static let shared = ShortcutsManager()
    
    private init() {}
    
    var monitors: [Int: Any] = [:]
    var shortcuts: [Int] = [123, 124] //TODO: read this from a file
    
    func startRegisteringShortcuts(){
        for keyCode in shortcuts{
            registerShortcut(forKey: keyCode)
        }
    }
    
    func stopRegisteringShortcuts(){
        unRegisterAllShortcuts()
    }
    
    private func registerShortcut(forKey keyCode: Int) {
        if monitors[keyCode] != nil{ return }
        
        let newMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.keyDown]) { event in
            if event.keyCode == keyCode && event.modifierFlags.contains(.command) && event.modifierFlags.contains(.option) {
                print("Command + Option + \(keyCode) pressed")
            }
        }
        
        monitors[keyCode] = newMonitor
    }
    
    private func unRegisterShortcut(forKey keyCode: Int) {
        if let existingMonitor = monitors[keyCode] {
            NSEvent.removeMonitor(existingMonitor)
            monitors.removeValue(forKey: keyCode)
        }
    }
    
    private func unRegisterAllShortcuts(){
        for (keyCode, existingMonitor) in monitors{
            NSEvent.removeMonitor(existingMonitor)
            monitors.removeValue(forKey: keyCode)
        }
    }
}
