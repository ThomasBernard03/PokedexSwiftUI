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
    var image : String { "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png" }
    let types : [PokemonType]
    var description : String
    var height : Int
    var weight : Float
    
    init(id: Int, name: String, types: [PokemonType], description: String, height: Int, weight: Float) {
        self.id = id
        self.name = name
        self.types = types
        self.description = description
        self.height = height
        self.weight = weight
    }

    
    init(from response: PokemonAPIResponse) {
        self.id = response.id
        self.name = response.name
        self.types = response.types.map { $0.type.name }
        self.description = ""
        self.weight = Float(response.weight) / 10
        self.height = response.height * 10
    }
}


//{
//    "Id": 1,
//    "Name": "bulbasaur",
//    "Types": [
//        "grass",
//        "poison"
//    ]
//}
