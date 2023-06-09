//
//  ContentView.swift
//  War Card Game
//
//  Created by Noor Chasib on 2023-03-16.
//

import SwiftUI

struct ContentView: View {
   @State var playerCard = "back"
   @State var cpuCard = "back"
   @State var playerScore = 0
   @State var cpuScore = 0
   @State var showAlert = false

   var body: some View {
      ZStack {
         Image("background-plain")
            .resizable()
            .ignoresSafeArea()

         VStack {
            Spacer()
            Image("logo")
            Spacer()
            HStack {
               Spacer()
               Image(playerCard)
               Spacer()
               Image(cpuCard)
               Spacer()
            }
            Spacer()

            Button {
               deal()
            } label: {
               Image("button")
            }

            Button(action: {
               showAlert = true
            }, label: {
               Text("Reset")
                  .foregroundColor(.white)
            })
            .alert(isPresented: $showAlert) {
               Alert(title: Text("Reset"),
                     message: Text("Are you sure you want to reset?"),
                     primaryButton: .destructive(Text("Yes")) {
                        reset()
                     },
                     secondaryButton: .cancel())
            }

            Spacer()
            HStack {
               Spacer()
               VStack {
                  Text("Player")
                     .font(.headline)
                     .padding(.bottom, 10.0)
                  Text(String(playerScore))
                     .font(.largeTitle)
               }
               Spacer()
               VStack {
                  Text("CPU")
                     .font(.headline)
                     .padding(.bottom, 10.0)
                  Text(String(cpuScore))
                     .font(.largeTitle)
               }
               Spacer()
            }
            .foregroundColor(.white)
            Spacer()
         }
         .padding()
      }
   }

   func deal() {
      // Randomize the player card
      let playerCardValue = Int.random(in: 2...14)
      playerCard = "card\(playerCardValue)"

      // Randomize the cpu card
      let cpuCardValue = Int.random(in: 2...14)
      cpuCard = "card\(cpuCardValue)"

      // Update the score
      if playerCardValue > cpuCardValue {
         // Add 1 to player score
         playerScore += 1
      }
      else if cpuCardValue > playerCardValue {
         // Add 1 to cpu score
         cpuScore += 1
      }
   }

   func reset() {
      // Reset player card
      playerCard = "back"
      // Reset cpu card
      cpuCard = "back"
      // Reset player score
      playerScore = 0
      // Reset cpu score
      cpuScore = 0
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
