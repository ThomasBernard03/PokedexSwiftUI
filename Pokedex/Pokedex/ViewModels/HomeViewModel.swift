//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import Foundation

class HomeViewModel {
    
    private let pokemonService = PokemonService()
    
    func getRandomPokemon() -> Pokemon {
        let pokemons : [Pokemon] = pokemonService.getPokemons()
        
        return pokemons.randomElement()!
    }
}
