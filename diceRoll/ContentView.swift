//
//  ContentView.swift
//  diceRoll
//
//  Created by Subhrajyoti Chakraborty on 28/09/20.
//

import SwiftUI

struct ContentView: View {
    var results = Results()
    
    var body: some View {
        TabView {
            DiceView()
                .tabItem {
                    Image(systemName: "circle.grid.3x3.fill")
                    Text("Dice")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
        }
        .environmentObject(results)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
