//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sandra Gomez on 6/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // The simplest way to make a button is when it just contains some text you pass in the title of the button, along with a closure that should be run when the button is tapped:
        //        Button("Delete selection") {
        //            print("Now deleting")
        //        }
        // That could be any function rather than just a closure so this kind of thing is fine:
        
        //        Button("Delete selection", action: executeDelete)
        //       }
        
        // There are a few different ways we can customize the way buttons look. We can attach a rold to the button which ios can use to adjust its appearance both visually and for screen readers. For example we could say that our Delete button has a destructive role like this:
        //
        //        Button("Delete selection", role: .destructive, action: executeDelete)
        //    }
        // Second, we can use of the built-in styles for buttons: .bordered and .borderedProminent.
        // These can be used by themselves or in combination with a role:
        //        VStack {
        //            Button("Button 1") { }
        //                .buttonStyle(.bordered)
        //            Button("Button 2", role: .destructive) { }
        //                .buttonStyle(.bordered)
        //            Button("Button 3") { }
        //                .buttonStyle(.borderedProminent)
        //            Button("Button 4", role: .destructive) { }
        //                .buttonStyle(.borderedProminent)
        //        }
        //    }
        
        // If you want to customize the colors used for a bordered button, use the tint() modifier like this:
        
        //        Button("Button 3") { }
        //            .buttonStyle(.borderedProminent)
        //            .tint(.mint)
        //    }
        
        //If you want something completely custom, you can pass a custom label using a second trailing closure:
        
        Button {
            print("Button was tapped")
        } label: {
            Text("Tap me!")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
        
    func executeDelete() {
        print("Now deleting…")
    }
}


#Preview {
    ContentView()
}
