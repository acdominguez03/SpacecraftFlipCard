//
//  SpacecraftCardBo.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

struct SpacecraftBO {
    let astronautNames: [String]
    let crewCount: Int
    let craftName: String
}

extension SpacecraftBO {
    var toSpacecraftVO: SpacecraftVO {
        .init(astronautNames: astronautNames, crewCount: crewCount, craftName: craftName)
    }
}
