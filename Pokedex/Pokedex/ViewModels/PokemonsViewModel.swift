//
//  PokemonsViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation


class PokemonsViewModel : ObservableObject {
    
    @Published var pokemons : [Pokemon] = []
    
    let apiService = APIService()
    let jsonService = JsonService()
    
    
    func getPokemons(){
        
        let pokemons : [Pokemon]? = jsonService.readJsonFile(jsonPathFile: Constants.pokemonsJSONFilePath)
        
        if pokemons != nil {
            self.pokemons = pokemons!
        }
    }
    
    
    func getPokemon(id : Int) -> Pokemon? {
        if pokemons.isEmpty {
            getPokemons()
        }
        
        
        return pokemons.first { pokemon in
            pokemon.id == id
        }
    }
    
}
