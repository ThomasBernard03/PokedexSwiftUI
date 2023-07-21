//
//  PokemonEvolutionView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 19/07/2023.
//

import SwiftUI

struct PokemonEvolutionView: View {
    
    let evolutionChain : PokemonEvolutionChain
    
    var body: some View {
        Text("")
    }
}

struct PokemonEvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        
        let evolutionChain = PokemonEvolutionChain(pokemonId: 1, level: 28, item: nil, evolutionChain: nil)
        
        PokemonEvolutionView(evolutionChain: evolutionChain)
            .previewLayout(.sizeThatFits)
    }
}
