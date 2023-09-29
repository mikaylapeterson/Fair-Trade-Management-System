//
//  ContentView.swift
//  Fair Trade Certification Management
//
//  Created by Mikayla Peterson on 2023-09-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        @State var counter = 0
        
        VStack {
            Image(systemName: "checkmark.seal.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Fair Trade Certification Management System")
            Text(counter.description)
            Button(action: {counter = counter + 1}) {
                Text("Increase Counter")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
