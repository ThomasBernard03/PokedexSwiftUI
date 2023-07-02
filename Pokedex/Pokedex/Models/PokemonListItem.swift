//
//  PokemonListItem.swift
//  Pokedex
//
//  Created by Thomas Bernard on 02/07/2023.
//

import Foundation


struct PokemonListItem : Identifiable {
    let id : Int
    let name : String
    var image : String { "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png" }
    let types : [PokemonType]
    
    
    init(id: Int, name: String, types: [PokemonType]) {
        self.id = id
        self.name = name
        self.types = types
    }
    
    init(from response: PokemonJSONResponse) {
        self.id = response.id
        self.name = response.name
        self.types = response.types
    }
}
