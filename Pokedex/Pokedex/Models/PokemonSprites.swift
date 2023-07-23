//
//  PokemonSprites.swift
//  Pokedex
//
//  Created by Thomas Bernard on 10/07/2023.
//

import Foundation


struct PokemonSprites : Decodable {
    
    let frontDefaultOfficialArtwork : String
    let frontShinyOfficialArtwork : String?
    
    private enum CodingKeys: String, CodingKey {
        case frontDefaultOfficialArtwork = "front_default_official_artwork"
        case frontShinyOfficialArtwork = "front_shiny_official_artwork"
    }
}
