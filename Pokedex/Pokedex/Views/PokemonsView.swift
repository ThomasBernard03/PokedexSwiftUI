//
//  PokemonsView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonsView: View {
    
    @ObservedObject var pokemonsViewModel = PokemonsViewModel()
    
    
    var body: some View {
        ZStack{
            
            
            VStack {

                List(pokemonsViewModel.pokemons){ pokemon in
                    PokemonItemView(pokemon: pokemon).listRowSeparator(.hidden)
                }.listStyle(.plain)
            }
            
        }.onAppear(){
            pokemonsViewModel.getPokemons()
        }
    }
}

struct PokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonsView()
    }
}
