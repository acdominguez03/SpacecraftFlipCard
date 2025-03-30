//
//  GetSpacecraftUsecase.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

protocol GetSpacecraftUseCaseProtocol {
    func execute() async throws -> Result<[SpacecraftBO], ErrorType>
}

struct GetSpacecraftUsecase: GetSpacecraftUseCaseProtocol {
    
    let repository: SpacecraftRepository = SpacecraftRepositoryImpl.shared
    
    func execute() async -> Result<[SpacecraftBO], ErrorType> {
        do {
            let result = try await repository.getSpacecraft()
            return .success(result)
        } catch {
            return .failure(ErrorType.noData)
        }
    }
}
