//
//  Pokemon.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation

struct Pokemon : Decodable, Identifiable {
    
    let id : Int
    let name : String
    let types : [PokemonType]
    let description : String
    let height : Int
    let weight : Float
    let sprites : PokemonSprites
    let stats : [PokemonStat]
    let abilities : [String]
    let growthRate : String
    let captureRate : Int
    let baseHappiness : Int
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case description
        case height
        case weight
        case sprites
        case stats
        case abilities
        case growthRate = "growth_rate"
        case captureRate = "capture_rate"
        case baseHappiness = "base_happiness"
    }
}
