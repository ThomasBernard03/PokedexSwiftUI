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
        NavigationView {
            ZStack {
                VStack {
                    List(pokemonsViewModel.pokemons) { pokemon in
                        NavigationLink(destination: PokemonView(pokemonId: pokemon.id)) {
                                PokemonItemView(pokemon: pokemon)
                                
                                    .listRowSeparator(.hidden)
                            }
                        }.listStyle(.plain)
                    }
                        
                }
                .navigationTitle("Pokedex")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                    }

                }
            }
        .onAppear(){
                pokemonsViewModel.getPokemons()
            }
        }
    
}


struct PokemonsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonsView()
    }
}
