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
    let types : [Type]
    let description : String
    let height : Int
    let weight : Float
    let sprites : PokemonSprites
    let stats : [PokemonStat]
    let abilities : [String]
    let growthRate : String
    let captureRate : Int
    let baseHappiness : Int
    let shape : String
    let evolutionChain : PokemonEvolutionChain
    
    
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
        case shape
        case growthRate = "growth_rate"
        case captureRate = "capture_rate"
        case baseHappiness = "base_happiness"
        case evolutionChain = "evolution_chain"
    }
}
