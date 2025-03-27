//
//  SpacecraftRepositoryImpl.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

struct SpacecraftRepositoryImpl: SpacecraftRepository {
    
    let remoteDataSource: RemoteDataSource = RemoteDataSource.shared
    
    static let shared: SpacecraftRepositoryImpl = SpacecraftRepositoryImpl()
    
    func getSpacecraft() async throws -> SpacecraftBO {
        do {
            let result = try await remoteDataSource.getSpacecraftData()
            return result.toSpacecraftBO
        } catch {
            throw error
        }
    }
}
