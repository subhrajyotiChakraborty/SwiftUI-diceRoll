//
//  DiceView.swift
//  diceRoll
//
//  Created by Subhrajyoti Chakraborty on 28/09/20.
//

import SwiftUI

struct DiceView: View {
    @State private var selectedNumber = 0
    @EnvironmentObject var results: Results

    var body: some View {
        NavigationView {
            VStack {
                Text("\(selectedNumber)")
                    .font(.custom("big", size: 150))
                    .fontWeight(.bold)
                    .frame(width: 200, height: 200, alignment: .center)
                    .border(Color.blue, width: 3)
                    .padding(.bottom, 10)
                    .cornerRadius(5)
                
                Button(action: {
                    withAnimation() {
                        self.selectedNumber = Int.random(in: 0...6)
                    }
                    let score = Score()
                    score.scoreStr = "You get no: \(self.selectedNumber)"
                    self.results.add(score)
                }, label: {
                    Text("Roll")
                        .frame(width: 100)
                        .padding()
                })
                .background(Color.blue, alignment: .center)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            
            .navigationTitle(Text("Dice"))
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
