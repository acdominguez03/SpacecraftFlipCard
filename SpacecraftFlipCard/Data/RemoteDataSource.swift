//
//  RemoteDataSource.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func getSpacecraftData() async throws -> SpacecraftDTO
}

struct RemoteDataSource: RemoteDataSourceProtocol {
    
    private init() { }
    
    static let shared: RemoteDataSource = RemoteDataSource()
    
    let apiManager: ApiManager = ApiManager.shared
    
    func getSpacecraftData() async throws -> SpacecraftDTO {
        let request = try apiManager.request(body: nil)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            return try JSONDecoder().decode(SpacecraftDTO.self, from: data)
        } catch {
            throw ErrorType.noData
        }
    }
}
