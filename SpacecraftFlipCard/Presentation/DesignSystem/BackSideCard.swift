//
//  BackSideCard.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import SwiftUI

struct BackSideCard: View {
    let astronautsNames: [String]
    
    var body: some View {
        ZStack {
            Image(.CardBackgrounds.back)
            
            VStack(alignment: .leading) {
                ForEach(Array(astronautsNames.enumerated()), id: \.offset) { index, name in
                    Text("\(index + 1). \(name)")
                        .foregroundStyle(Color.BackSideColors.text)
                }
            }
        }
    }
}

#Preview {
    BackSideCard(astronautsNames: [
        "Oleg Kononenko",
        "Nikolai Chub",
        "Tracy Caldwell Dyson",
        "Matthew Dominick",
        "Michael Barratt",
        "Jeanette Epps",
        "Alexander Grebenkin",
        "Butch Wilmore",
        "Sunita Williams",
        "Li Guangsu",
        "Li Cong",
        "Ye Guangfu"
    ])
}
