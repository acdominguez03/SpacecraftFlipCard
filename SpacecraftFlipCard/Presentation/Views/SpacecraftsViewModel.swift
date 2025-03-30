//
//  SpacecraftFlipCardViewModel.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import Foundation

@Observable
@MainActor final class SpacecraftsViewModel {
    var spacecrafts: [SpacecraftVO] = []
    
    var isLoading: Bool = true
    var errorMessage: String = ""
    
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
            case .success(let spacecraftsBO):
                self.spacecrafts = spacecraftsBO.map{ $0.toSpacecraftVO }
                self.isLoading = false
            case .failure(let error):
                self.errorMessage = error.message
                self.isLoading = false
            }
        }
    }
}
