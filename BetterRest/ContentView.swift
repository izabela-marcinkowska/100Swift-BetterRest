//
//  ContentView.swift
//  BetterRest
//
//  Created by Izabela Marcinkowska on 2024-09-09.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 3...15, step: 3)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
