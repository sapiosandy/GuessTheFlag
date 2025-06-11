//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Sandra Gomez on 6/4/25.
//

import SwiftUI

struct TextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.blue)
            .font(.largeTitle.weight(.bold))
            
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TextStyle())
    }
}
    

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

extension View {
    func flagStyle() -> some View {
        modifier(FlagImage())
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    @State private var turn: Int = 0
    @State private var newGame = false
    @State private var showingFinalAlert = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green:0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Question \(turn) of 8")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .titleStyle()
                    }
        
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label : {
                            Image(countries[number])
                                .flagStyle()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message : {
            Text("Your score is \(score)")
                .foregroundStyle(.white)
                .font(.title.bold())
        }
        .alert("Game Over", isPresented: $showingFinalAlert) {
            Button("Start New Game") {
                resetGame()
            }
        } message: {
            Text("You finished with a score of \(score) out of 8")
        }
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }
        
        if turn == 8 {
            showingFinalAlert = true
        } else {
            showingScore = true
        }
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        turn += 1
        }
    
    func resetGame() {
        score = 0
        turn = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
#Preview {
    ContentView()
}
