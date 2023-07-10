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
}
