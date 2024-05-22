//
//  ShortcutsManager.swift
//  goggles
//
//  Created by Joy Paul on 5/22/24.
//

import Foundation
import Cocoa

class ShortcutsManager{
    static let shared = ShortcutsManager()
    
    private init() {}
    
    var monitor: Any?
    
    func registerShortcut(forKey keyCode: Int) {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: [.keyDown]) { event in
            if event.keyCode == keyCode && event.modifierFlags.contains(.command) && event.modifierFlags.contains(.shift) {
                print("Command + Shift + \(keyCode) pressed")
            }
        }
    }
    
    func unRegisterShortcut() {
        if let monitor = monitor {
            NSEvent.removeMonitor(monitor)
            self.monitor = nil
        }
    }
}
