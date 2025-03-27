//
//  SpacecraftCard.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import SwiftUI

struct SpacecraftFlipCardView: View {
    @State private var viewModel: SpacecraftFlipCardViewModel = SpacecraftFlipCardViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(.Colors.backgroundOne), Color(.Colors.backgroundTwo)],
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(Color.white)
            } else if !viewModel.errorMessage.isEmpty {
                VStack(spacing: 10) {
                    Image(.Icons.noData)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    Text(viewModel.errorMessage)
                        .foregroundStyle(Color.white)
                        .font(.custom("ChivoMono", size: 25))
                }
            } else {
                ZStack {
                    FrontSideCard(
                        craftName: "\(viewModel.spacecraft.craftName) Spacecraft",
                        crewCount: viewModel.spacecraft.crewCount
                    )
                    .opacity(viewModel.isFlipped ? 0.0 : 1.0)
                    .rotation3DEffect(.degrees(viewModel.rotationAngle), axis: (x: 0, y: 1, z: 0)
                    )
                    
                    BackSideCard(astronautsNames: viewModel.spacecraft.astronautNames)
                        .opacity(viewModel.isFlipped ? 1.0 : 0.0)
                        .rotation3DEffect(.degrees(viewModel.rotationAngle + 180), axis: (x: 0, y: 1, z: 0)
                        )
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        viewModel.flipCard()
                    }
                }
            }
        }
    }
}

#Preview {
    SpacecraftFlipCardView()
}
