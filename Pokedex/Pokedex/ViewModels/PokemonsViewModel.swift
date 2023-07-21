//
//  PokemonsViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation


class PokemonsViewModel : ObservableObject {
    
    @Published var pokemons : [Pokemon] = []
    
    
    private let pokemonService = PokemonService()
    
    
    func getPokemons(){
        
        let pokemons : [Pokemon] = pokemonService.getPokemons()
        
        self.pokemons = pokemons
    }    
}
