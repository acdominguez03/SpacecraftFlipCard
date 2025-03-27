//
//  Untitled.swift
//  SpacecraftFlipCard
//
//  Created by Andres Cordón on 27/3/25.
//

struct SpacecraftDTO: Decodable {
    let people: [AstronautDTO]
    let number: Int
    let message: String
}

extension SpacecraftDTO {
    var toSpacecraftBO: SpacecraftBO {
        .init(
            astronautNames: people.map({ astronaut in
                astronaut.name
            }),
            crewCount: number,
            craftName: !people.isEmpty ? people.first!.craft : "Unknown" 
        )
    }
}
