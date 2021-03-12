//
//  ContentView.swift
//  RockyPaper
//
//  Created by Burhan Kaynak on 28/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldWin = Bool.random()
    @State private var alertIsVisible = false
    @State private var choice = ""
    @State private var score = 0
    @State private var round = 0
    var moves = ["🪨", "📜", "✂️"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("I have chose")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom)
                Text("\(choice)")
                    .buttonStyle()
                Text("You must \(shouldWin ? "WIN" : "LOSE")")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                HStack {
                    Button(moves[0]) { //rock
                        self.nextMove()
                        if self.choice == self.moves[2] && self.shouldWin || self.choice == self.moves[1] && !self.shouldWin {
                            self.score += 1
                        } else if self.choice == self.moves[0] && self.shouldWin || self.choice == self.moves[0] && !self.shouldWin {
                            self.score += 0
                        } else {
                            self.score -= 1
                        }
                        shouldWin = Bool.random()
                    }.buttonStyle()
                    Button(moves[1]) { // paper
                        self.nextMove()
                        if self.choice == self.moves[0] && self.shouldWin || self.choice == self.moves[2] && !self.shouldWin {
                            self.score += 1
                        } else if self.choice == self.moves[1] && self.shouldWin || self.choice == self.moves[1] && !self.shouldWin {
                            self.score += 0
                        } else {
                            self.score -= 1
                        }
                        print(score)
                        shouldWin = Bool.random()
                    }.buttonStyle()
                    Button(moves[2]) { // scissors
                        self.nextMove()
                        if self.choice == self.moves[1] && self.shouldWin || self.choice == self.moves[0] && !self.shouldWin {
                            self.score += 1
                        } else if self.choice == self.moves[2] && self.shouldWin || self.choice == self.moves[2] && !self.shouldWin {
                            self.score += 0
                        } else {
                            self.score -= 1
                        }
                        print(score)
                        shouldWin = Bool.random()
                    }.buttonStyle()
                }
                Text("Score: \(score)")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .alert(isPresented: $alertIsVisible) {
                        Alert(title: Text(score < 10 ? "You Lost!" : "You Won!"), message: Text("You have scored \(score)"), dismissButton: .default(Text("Another round?")) {
                            self.nextMove()
                            score = 0
                        })
                    }
            }
        }
    }

    func nextMove() {
        if round < 10 {
            round += 1
        } else {
            alertIsVisible = true
            round = 0
        }
        choice = moves[Int.random(in: 0...2)]
    }
}

struct ButtonImage: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .bold()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
