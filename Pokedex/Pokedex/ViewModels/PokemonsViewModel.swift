//
//  PokemonsViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation
import PokemonAPI


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
    
}
