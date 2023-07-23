//
//  RecursiveEvolutionChainView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 23/07/2023.
//

import SwiftUI

struct RecursiveEvolutionChainView: View {
    let evolutionChain: PokemonEvolutionChain
    let pokemonViewModel = PokemonViewModel()


    var body: some View {
        ForEach(evolutionChain.evolutionChain!, id: \.self) { chain in
            
            let currentPokemon = pokemonViewModel.getPokemon(id: evolutionChain.pokemonId)
            let nextPokemon = pokemonViewModel.getPokemon(id: chain.pokemonId)
            
            if(currentPokemon != nil && nextPokemon != nil){
                EvolutionChainView(firstPokemon: currentPokemon!, secondPokemon: nextPokemon!, item: chain.item, level: chain.level)
            }
            

            
            if(chain.evolutionChain != nil){
                RecursiveEvolutionChainView(evolutionChain: chain)
            }
                

        }
    }
}
