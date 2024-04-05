//
//  ContentViewExtensions.swift
//  goggles
//
//  Created by Joy Paul on 4/5/24.
//

import SwiftUI
import Foundation

extension ContentView {
    func quit() {
        debugPrint("Pressed quit")
        NSApplication.shared.terminate(nil)
    }
}
