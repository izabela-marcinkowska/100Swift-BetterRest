//
//  ContentView.swift
//  BetterRest
//
//  Created by Izabela Marcinkowska on 2024-09-09.
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
   
    var body: some View {
        NavigationStack {
            
        VStack {
          Text("When do you want to wake up?")
                .font(.headline)
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            Text("Desired amount of sleep")
                .font(.headline)
            Stepper("\(sleepAmount.formatted())hours", value: $sleepAmount, in: 4...12, step: 0.25)
            Text("Daily coffee intake")
                .font(.headline)
            Stepper("\(coffeeAmount.formatted()) cup(s)", value: $coffeeAmount, in: 1...20)
        }
        .padding()
        .navigationTitle("BetterRest")
        .toolbar{
            Button("Calculate", action: calculateBedTime)
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {}
        } message: {
                Text(alertMessage)
            }
        }
    }
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let predition = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - predition.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            
        }
        showingAlert = true
        
    }
}



#Preview {
    ContentView()
}
