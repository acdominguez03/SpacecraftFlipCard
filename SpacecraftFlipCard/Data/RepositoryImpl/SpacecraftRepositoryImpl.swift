//
//  SpacecraftRepositoryImpl.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

struct SpacecraftRepositoryImpl: SpacecraftRepository {
    
    let remoteDataSource: RemoteDataSource = RemoteDataSource.shared
    
    static let shared: SpacecraftRepositoryImpl = SpacecraftRepositoryImpl()
    
    func getSpacecraft() async throws -> [SpacecraftBO] {
        do {
            let result = try await remoteDataSource.getSpacecraftData()
            let crafts = Dictionary(grouping: result.people, by: { $0.craft })
            var spacecrafts: [SpacecraftBO] = []
            crafts.forEach { craft, astronauts in
                spacecrafts.append(SpacecraftBO(astronautNames: astronauts.map { $0.name }, crewCount: astronauts.count, craftName: craft))
            }
            return spacecrafts
        } catch {
            throw error
        }
    }
}
