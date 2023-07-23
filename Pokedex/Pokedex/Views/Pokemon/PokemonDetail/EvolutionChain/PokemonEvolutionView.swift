//
//  PokemonEvolutionView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 19/07/2023.
//

import SwiftUI

struct PokemonEvolutionView: View {
    let pokemonViewModel = PokemonViewModel()
    let evolutionChain : PokemonEvolutionChain
    
    var body: some View {
        VStack {
            HStack {
                Text("Evolution chain")
                    .font(.title3)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 20)
            
            if(evolutionChain.evolutionChain == nil){
                Text("This pokemon has no evolution!")
            }
            else {
                RecursiveEvolutionChainView(evolutionChain: evolutionChain)
            }
        
        }
        .padding(.all, 20)
    }
}


struct PokemonEvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        
        let evolutionChain = PokemonEvolutionChain(pokemonId: 1, level: 28, item: nil, evolutionChain: nil)
        
        PokemonEvolutionView(evolutionChain: evolutionChain)
            .previewLayout(.sizeThatFits)
    }
    
}
