//
//  ContentView.swift
//  goggles
//
//  Created by Joy Paul on 4/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ){
            Label("Status: ", systemImage: "")
            Label("Left ", systemImage: "")
            Label("Right: ", systemImage: "")
            Label("Full screen: ", systemImage: "")
            Button(action: quit, label: { Text("Quit") })
        }
    }
}

#Preview {
    ContentView()
}
