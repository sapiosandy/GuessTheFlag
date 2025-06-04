//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sandra Gomez on 6/4/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // SwiftUI has a dedicated Image type for handling pictures in your apps, and there are three main ways you will create them:
        
       // Image("pencil") will load an image called “Pencil” that you have added to your project.
       // Image(decorative: "pencil") will load the same image, but won’t read it out for users who have enabled the screen reader. This is useful for images that don’t convey additional important information.
        //Image(systemName: "pencil") will load the pencil icon that is built into iOS. This uses Apple’s SF Symbols icon collection, and you can search for icons you like – download Apple’s free SF Symbols app from the web to see the full set.
        
        // By default the screen reader will read your image name if it is enabled, so make sure you give your images clear names if you want to avoid confusing the user. Or, if they don’t actually add information that isn’t already elsewhere on the screen, use the Image(decorative:) initializer.
        
        //Because the longer form of buttons can have any kind of views inside them, you can use images like this:

//        Button {
//            print("Edit button was tapped")
//        } label: {
//            Image(systemName: "pencil")
//        }
        
        //If you want both text and image at the same time, you have two options. The first is provide them both to the Button directly, like this:
        
//        Button("Edit", systemImage: "pencil") {
//            print("Edit button was tapped")
//        }
        
        //But if you want something more custom, SwiftUI has a dedicated type called Label.

        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
    
    // Both of those will show both a pencil icon and the word “Edit” side by side, which on the surface sounds exactly the same as what we’d get by using a simple HStack. However, SwiftUI is really smart: it will automatically decide whether to show the icon, the text, or both depending on how they are being used in our layout, which makes this option a great choice.
  
}


#Preview {
    ContentView()
}
