//
//  PokemonsView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonsView: View {
    
    @ObservedObject var pokemonsViewModel = PokemonsViewModel()
    @State private var searchText = ""
    
    
    
    var body: some View {
        ZStack {
            VStack {
                
                TextField("Search a pokemon", text: $searchText)
                    .disableAutocorrection(true)
                    .padding(16)
                    .padding(.horizontal, 45)
                    .background(Color(.systemGray6))
                    .cornerRadius(40)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color("DarkGreyColor"))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 20)
                            
                        }
                    )
                    .padding(.horizontal, 20)
                
                
                ScrollView {
                    LazyVStack {
                        ForEach(pokemonsViewModel.pokemons.filter {
                            searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
                        }) { pokemon in
                            NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                                PokemonItemView(pokemon: pokemon)
                            }
                        }

                    }
                    .padding(.all, 20)
                }
            }
            .navigationTitle("Pokemons")
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
