//
//  FrontCard.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import SwiftUI

struct FrontSideCard: View {
    let craftName: String
    let crewCount: Int
    
    var body: some View {
        ZStack {
            Image(.CardBackgrounds.front)
            
            VStack(spacing: 5) {
                Text(craftName)
                    .font(.custom("ChivoMono", size: 28))
                    .foregroundStyle(Color.FrontSideColors.primaryText)
                
                Text("\(crewCount) crew members")
                    .font(.custom("ChivoMono", size: 16))
                    .foregroundStyle(Color.FrontSideColors.secondaryText)
            }
        }
    }
}

#Preview {
    FrontSideCard(craftName: "ISS Spacecraft", crewCount: 12)
}
