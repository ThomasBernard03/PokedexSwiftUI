//
//  HomeView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//
import SwiftUI

struct HomeView: View {
    
    let homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: PokemonsView()) {
                    HomeItemView(title: "Pokemons", color: Constants.Colors.grassColor)
                }
                
                NavigationLink(destination: MovesView()) {
                    HomeItemView(title: "Moves", color: Constants.Colors.fireColor)
                }

                
                
                
                HomeItemView(title: "Abilities", color: Constants.Colors.waterColor)
                
                NavigationLink(destination: ItemsView()) {
                    HomeItemView(title: "Items", color: Constants.Colors.electricColor)
                }
                
                RandomPokemonView(pokemon: homeViewModel.getRandomPokemon())
                
                
            }
            .padding(20)
            .navigationTitle("Welcome")
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
