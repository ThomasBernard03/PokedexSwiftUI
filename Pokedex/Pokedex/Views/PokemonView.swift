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
            VStack {
                HStack {
                    Text(pokemonViewModel.pokemon?.name ?? "")
                        .foregroundColor(.white)
                        .font(.title)
    
                    Spacer()
    
                    Text("#\(String(format: "%03d", pokemonViewModel.pokemon?.id ?? 0))")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
    
                }
                HStack {
                    ForEach(pokemonViewModel.pokemon?.types ?? [], id: \.self) { type in
                        Text(type.rawValue)
                            .foregroundColor(.white)
                            .padding(.all, 10)
                        .background(pokemonViewModel.pokemon?.types.first?.lightColor() ?? Color("GreyColor"))
                            .cornerRadius(12)
                    }
                    Spacer()
                }
                VStack {
                    AsyncImage(url: URL(string:pokemonViewModel.pokemon?.image ?? "")) { image in
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
        .background(pokemonViewModel.pokemon?.types.first?.color() ?? Color("GreyColor"))
        .onAppear(){
            pokemonViewModel.getPokemon(id: pokemonId)
        }
    }

}

struct PokemonView_Previews: PreviewProvider {

    
    
    static var previews: some View {
        
        
        PokemonView(pokemonId: 1)
    }
}
