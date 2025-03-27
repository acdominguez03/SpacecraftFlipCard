//
//  SpacecraftFlipCardViewModel.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import Foundation

@Observable
@MainActor final class SpacecraftFlipCardViewModel {
    var spacecraft: SpacecraftVO = SpacecraftVO(astronautNames: [], crewCount: 0, craftName: "")
    
    var isLoading: Bool = true
    var errorMessage: String = ""
    
    var isFlipped = false
    var rotationAngle: Double = 0
    
    let getSpacecraftUsecase: GetSpacecraftUsecase
    
    init(getSpacecraftUsecase: GetSpacecraftUsecase = GetSpacecraftUsecase()) {
        self.getSpacecraftUsecase = getSpacecraftUsecase
        Task {
            await getSpacecraft()
        }
    }
    
    func getSpacecraft() async {
        let result = await getSpacecraftUsecase.execute()
        
        DispatchQueue.main.async {
            switch result {
            case .success(let spacecraftBO):
                self.spacecraft = spacecraftBO.toSpacecraftVO
                self.isLoading = false
            case .failure(let error):
                self.errorMessage = error.message
                self.isLoading = false
            }
        }
    }
    
    func flipCard() {
        rotationAngle -= 180
        isFlipped.toggle()
    }
}
