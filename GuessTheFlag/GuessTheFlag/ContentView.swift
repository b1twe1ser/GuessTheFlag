//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by bitweiser on 20.03.22.
//  GitHub: https://github.com/b1twe1ser
//  Instagram: https://www.instagram.com/bitweiser/

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 78/255, green: 84/255, blue: 200/225), Color(red: 143/255, green: 148/255, blue: 251/255)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
    
               
                VStack {
                    Text("Tap the right flag")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Text(countries[correctAnswer])
                        .padding(.bottom)
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .medium))
                        
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    .cornerRadius(10)
                    // .clipShape(capsule) would make it a capsule shape
                    .shadow(color: .gray, radius: 5, x: 2, y: 2)
                }
                VStack {
                    
                    Text("Score: \(score)")
                        .padding(.top, 120)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
            }
        }
        
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            askQuestion()
        } else {
            
            askQuestion()
        }
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
