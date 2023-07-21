//
//  PokemonService.swift
//  Pokedex
//
//  Created by Thomas Bernard on 21/07/2023.
//

import Foundation


class PokemonService {
    
    private let jsonService = JsonService()
    
    func getPokemons() -> [Pokemon] {
        let pokemons : [Pokemon]? = jsonService.readJsonFile(jsonPathFile: Constants.pokemonsJSONFilePath)
        
        if pokemons != nil {
            return pokemons!
        }
        
        return []
    }
    
    func getPokemon(id : Int) -> Pokemon? {
        let pokemons : [Pokemon]? = jsonService.readJsonFile(jsonPathFile: Constants.pokemonsJSONFilePath)

        return pokemons?.first { $0.id == id}
    }
}
