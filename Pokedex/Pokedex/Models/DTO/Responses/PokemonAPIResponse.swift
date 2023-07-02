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
    let types : [PokemonTypesAPIResponse]
    
    
    struct PokemonSpeciesAPIResponse : Decodable {
        let name : String
        let url : String
    }
    
    struct PokemonTypesAPIResponse : Decodable {
        let slot : Int
        let type : PokemonTypesDetailAPIResponse
        
        
        struct PokemonTypesDetailAPIResponse : Decodable {
            let name : PokemonType
            let url : String
        }
    }
}
