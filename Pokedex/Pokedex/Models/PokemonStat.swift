//
//  PokemonStat.swift
//  Pokedex
//
//  Created by Thomas Bernard on 19/07/2023.
//

import Foundation


struct PokemonStat : Decodable, Hashable {
    let name : String
    let value : Int
}
