//
//  SpacecraftFlipCard.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 30/3/25.
//

import SwiftUI

struct SpacecraftFlipCard: View {
    @State var isFlipped = false
    @State var rotationAngle: Double = 0
    let spacecraft: SpacecraftVO
    
    var body: some View {
        ZStack {
            FrontSideCard(
                craftName: "\(spacecraft.craftName) Spacecraft",
                crewCount: spacecraft.crewCount
            )
            .opacity(isFlipped ? 0.0 : 1.0)
            .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
            
            BackSideCard(astronautsNames: spacecraft.astronautNames)
                .opacity(isFlipped ? 1.0 : 0.0)
                .rotation3DEffect(.degrees(rotationAngle + 180), axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.6)) {
                rotationAngle -= 180
                isFlipped.toggle()
            }
        }
    }
}

#Preview {
    SpacecraftFlipCard(spacecraft: SpacecraftVO(astronautNames: ["Andrés", "Ismael"], crewCount: 2, craftName: "Mobile Developers"))
}
