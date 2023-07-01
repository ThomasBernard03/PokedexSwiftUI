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
    var weight : Int
    
    init(id: Int, name: String, types: [PokemonType], description: String, height: Int, weight: Int) {
        self.id = id
        self.name = name
        self.types = types
        self.description = description
        self.height = height
        self.weight = weight
    }
    
    init(from response: PokemonJSONResponse) {
        self.id = response.id
        self.name = response.name
        self.types = response.types
        self.description = ""
        self.weight = 0
        self.height = 0
    }
    
    init(from response: PokemonAPIResponse) {
        self.id = response.id
        self.name = response.name
        self.types = []
        self.description = ""
        self.weight = response.weight
        self.height = 0
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
