//
//  PokemonJsonResponse.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation


struct PokemonJSONResponse : Decodable {
    let id : Int
    let name : String
    let types : [PokemonType]
}
