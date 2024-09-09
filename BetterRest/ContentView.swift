//
//  ContentView.swift
//  BetterRest
//
//  Created by Izabela Marcinkowska on 2024-09-09.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8
    @State private var wakeUp = Date.now
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 3...15, step: 3)
            DatePicker("Place enter a date", selection: $wakeUp,  in: Date.now..., displayedComponents: .date)
                .labelsHidden()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
