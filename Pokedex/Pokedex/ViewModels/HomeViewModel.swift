//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import Foundation

class HomeViewModel {
    
    let jsonService = JsonService()
    
    
    func getRandomPokemon() -> Pokemon {
        let pokemons : [Pokemon]? = jsonService.readJsonFile(jsonPathFile: Constants.pokemonsJSONFilePath)
        
        
        return pokemons!.randomElement()!
    }
}
