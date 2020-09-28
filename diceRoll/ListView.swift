//
//  ListView.swift
//  diceRoll
//
//  Created by Subhrajyoti Chakraborty on 28/09/20.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var results: Results
    
    var body: some View {
        NavigationView {
            List(results.resultList.reversed(), id: \.id) { score in
                Text("\(score.scoreStr)")
            }
            .navigationTitle(Text("List"))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
