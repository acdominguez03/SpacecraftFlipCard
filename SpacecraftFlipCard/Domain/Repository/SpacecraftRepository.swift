//
//  SpacecraftCardRepository.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//


protocol SpacecraftRepository {
    func getSpacecraft() async throws -> [SpacecraftBO]
}
