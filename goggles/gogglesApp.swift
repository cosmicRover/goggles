//
//  gogglesApp.swift
//  goggles
//
//  Created by Joy Paul on 4/5/24.
//

import SwiftUI

@main
struct gogglesApp: App {
    @StateObject private var accessibilityManager = AccessibilityManager()
    
    var body: some Scene {
        MenuBarExtra("RemSync", systemImage: "eyeglasses") {
            ContentView()
                .environmentObject(accessibilityManager)
        }
    }
}
