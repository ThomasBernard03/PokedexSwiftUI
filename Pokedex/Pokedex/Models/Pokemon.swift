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
    var image : String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
    }
    let types : [PokemonType]
}


//{
//    "Id": 1,
//    "Name": "bulbasaur",
//    "Types": [
//        "grass",
//        "poison"
//    ]
//}
