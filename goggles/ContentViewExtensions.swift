//
//  ContentViewExtensions.swift
//  goggles
//
//  Created by Joy Paul on 4/5/24.
//

import SwiftUI
import Foundation
import os.log

extension ContentView {
    func quit() {
        os_log("User pressed quit", log: OSLog.application, type: .info)
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        
        DispatchQueue.global(qos: .background).async {
            ShortcutsManager.shared.stopRegisteringShortcuts()
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            NSApplication.shared.terminate(nil)
        }
    }
    
    func launchAccessibilitySetting(){
        accessibilityManager.updateAccessStatus(willDisplayAccessibilityPrompt: true)
    }
}
