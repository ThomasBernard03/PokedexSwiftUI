//
//  PokemonView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemonId : Int
    @ObservedObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {

        VStack {
            if let pokemon = pokemonViewModel.pokemon {
                PokemonPreviewView(pokemon: pokemon)
                    
            }
        
        }
        .padding(.horizontal, 20)
        .background(pokemonViewModel.pokemon?.types.first?.color() ?? .white)
        .toolbar{
            Image(systemName: "heart")
                .foregroundColor(.white)
        }
        .onAppear(){
            pokemonViewModel.getPokemon(id: pokemonId)
        }
        

    }
}


struct PokemonPreviewView : View {
    let pokemon : Pokemon
    
    var body : some View {
        VStack {
            
            HStack {
                Text(pokemon.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("#\(String(format: "%03d", pokemon.id))")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            HStack {
                ForEach(pokemon.types, id: \.self) { type in
                    Text(type.rawValue)
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .background(pokemon.types.first?.lightColor() ?? Color("GreyColor"))
                        .cornerRadius(12)
                }
                
                Spacer()
            }
            
            AsyncImage(url: URL(string:pokemon.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } placeholder: {
                Image("Pokeball")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            
        }.background(.red)
    }
}

struct PokemonView_Previews: PreviewProvider {

    
    
    static var previews: some View {
        PokemonView(pokemonId: 1).previewLayout(.sizeThatFits)
    }
}



