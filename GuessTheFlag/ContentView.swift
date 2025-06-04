//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sandra Gomez on 6/4/25.
//

import SwiftUI

// Here's some example code that shows an alert when a button is tapped:

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("OK") {}
//        }
//        
        //The first part is the alert title, which is straightforward enough, but there's also another two-way data binding because SwiftUI will automatically set showingAlert back to false when the alert is dismissed.
        // Now look at the button:
        // Button("Ok") {}
        // That's an empty closure, meaning that we aren't assigning any functionality to run when the button is pressed That doesn't matter though because any button inside an alert will automatically dismiss the alert - that closure is there to let us add any extra functionality beyond just dismissing the alert.
        
        // You can add more buttons to your alert, and this is a particularly good place to add roles to make sure it's clear what each button does.
        
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Delete", role: .destructive) { }
//            Button("Cancel", role: .cancel) { }
//        }
        
        // And finally you can add message text to go alongside your title with a second trailing closure like this:
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
    }
}
    


#Preview {
    ContentView()
}
