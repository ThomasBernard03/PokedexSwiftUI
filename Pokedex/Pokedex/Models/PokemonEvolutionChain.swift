//
//  PokemonEvolutionChain.swift
//  Pokedex
//
//  Created by Thomas Bernard on 21/07/2023.
//

import Foundation


struct PokemonEvolutionChain : Decodable, Hashable {
    
    let pokemonId : Int
    let level : Int?
    let item : String?
    let evolutionChain : [PokemonEvolutionChain]?
    
    enum CodingKeys: String, CodingKey {
        case pokemonId = "pokemon_id"
        case level
        case item
        case evolutionChain = "evolution_chain"

    }
}
