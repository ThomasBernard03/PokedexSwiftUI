//
//  PokemonView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon : Pokemon
    @ObservedObject var pokemonViewModel = PokemonViewModel()
    
    var body: some View {
        
        
        VStack {
            VStack {
                HStack {
                    Text(pokemon.name)
                        .foregroundColor(.white)
                        .font(.title)
                    
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
                VStack {
                    AsyncImage(url: URL(string:pokemon.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Text("")
                    }
                }
            }.padding(.all, 20)
                .padding(.top, 50)
            VStack {
                HStack {
                    Spacer()
                    Text(pokemonViewModel.pokemon?.description ?? "")
                    Spacer()
                }
                Spacer()
            }
            .padding(.all, 40)
            .background(.white)
            .cornerRadius(12)
        }
        .ignoresSafeArea(.all)
        .background(pokemon.types.first?.color() ?? Color("GreyColor"))
        .onAppear(){
            pokemonViewModel.getPokemon(id: pokemon.id)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {

    
    
    static var previews: some View {
        let bulbasaur = Pokemon(
            id: 1,
            name: "Bulbasaur",
            types: [.grass, .poison],
            description : "For some time after its birth, it\ngrows by gaining nourishment from\nthe seed on its back.",
            height: 7,
            weight: 69
        )
        
        
        PokemonView(pokemon: bulbasaur)
    }
}
