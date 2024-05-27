//
//  ContentView.swift
//  goggles
//
//  Created by Joy Paul on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var accessibilityManager: AccessibilityManager
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ){
            Text(accessibilityManager.isAccessEnabled ? "Accessibility permission: Granted" : "Accessibility permission: Denied")
            Divider()
            ForEach(HandledKeyCodes.allCases, id: \.self){ shortcut in
                Label(shortcut.shortcutText, systemImage: "")
            }
            Divider()
            Button(action: quit, label: { Text("Quit") })
        }
    }
}

//Preview
//struct ContentView_Preview: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .environmentObject(AccessibilityManager())
//    }
//}
