//
//  SpacecraftCard.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import SwiftUI

struct SpacecraftsView: View {
    @State private var viewModel: SpacecraftsViewModel = SpacecraftsViewModel()
    
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
                LazyVStack {
                    ForEach(viewModel.spacecrafts, id: \.self) { spacecraft in
                        SpacecraftFlipCard(spacecraft: spacecraft)
                    }
                }
            }
        }
    }
}

#Preview {
    SpacecraftsView()
}
