//
//  PokemonApiResponse.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation

struct PokemonAPIResponse : Decodable {
    let id : Int
    let name : String
    let height : Int
    let weight : Int
    let species : PokemonSpeciesAPIResponse
    
    
    struct PokemonSpeciesAPIResponse : Decodable {
        let name : String
        let url : String
    }
}
