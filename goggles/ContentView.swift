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
            Text(accessibilityManager.isAccessEnabled ? "Accessibility permission granted" : "Accessibility permission denied")
            Label("Left ", systemImage: "")
            Label("Right: ", systemImage: "")
            Label("Full screen: ", systemImage: "")
            Button(action: quit, label: { Text("Quit") })
        }.onAppear{
            print("this should trigger but it doesnt")
            
            //TODO: call registration functions on accessibilityManager
            if accessibilityManager.isAccessEnabled{
                print("HERE!!!!")
            } else{
                
            }
        }
    }
}

#Preview {
    ContentView()
}
