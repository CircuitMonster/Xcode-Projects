//
//  ContentView.swift
//  RPSGame
//
//  Created by Brian Ackley on 6/13/20.
//  Copyright © 2020 Petrol On Tap. All rights reserved.
//

import SwiftUI

struct buttonView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250)
            .padding()
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(color: .gray, radius: 3)
        
        //fix clipable size for buttons!!!
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(buttonView())
    }
}

struct ContentView: View {
    @State private var itemChoice = Int.random(in: 0...2)
    @State private var outcomeChoice = Bool.random()
    @State private var showingScore = false
    @State private var totalScore = 0
    
    var gameItem = ["Rock", "Paper", "Scissors"]
    
    
    var winLose: String {
        let winLose = outcomeChoice
        
        if winLose == true {
            return "Win"
        } else {
            return "Lose"
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 50) {
                Spacer()
                
                HStack {
                    Section(header: Text("Game's Move:")) {
                        Text(gameItem[itemChoice])
                    }
                }
                HStack {
                    Section(header: Text("Win or Lose?:")) {
                        Text(winLose)
                    }
                }
                VStack(spacing: 30) {
                    ForEach(0..<3) { number in
                        Button(action: {
                            self.correctAnswer(number)
                            self.nextPlay()
                        }) {
                            Text(self.gameItem[number])
                        }
                        .buttonStyle()
                    }
                }
                Spacer()
                
                HStack {
                    Text("Current Score: \(totalScore)")
                }
            }
                .alert(isPresented: $showingScore) {
                Alert(title: Text("Game Over!"), message: Text("Your Score: \(totalScore)"),dismissButton: .default(Text("Continue")){
                    self.totalScore = 0
                    })
                }
                
            .navigationBarTitle("Rock, Paper, Scissors")
        }
    }
    
    func correctAnswer(_ number: Int) {
        while itemChoice == 0 {
            if outcomeChoice == true {
                if number == 1 {
                    totalScore += 1
                } else {
                    totalScore -= 1
                }
            }else if outcomeChoice == false {
                if number == 2 {
                    totalScore += 1
                } else {
                    totalScore -= 1
                }
            }
            break
        }
        
        while itemChoice == 1 {
            if outcomeChoice == true {
                if number == 2 {
                    totalScore += 1
                } else {
                    totalScore -= 1
                }
            }else if outcomeChoice == false {
                if number == 0 {
                    totalScore += 1
                } else {
                    totalScore -= 1
                }
            }
            break
        }
        
        while itemChoice == 2 {
            if outcomeChoice == true {
                if number == 0 {
                    totalScore += 1
                } else {
                    totalScore -= 1
                }
            }else if outcomeChoice == false {
                if number == 1 {
                    totalScore += 1
                } else {
                    totalScore -= 1
                }
            }
            break
        }
        
        if totalScore == 10 {
            showingScore = true
        }
    }
    
    func nextPlay() {
        itemChoice = Int.random(in: 0...2)
        outcomeChoice = Bool.random()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

