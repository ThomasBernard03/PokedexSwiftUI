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
            }.padding(.horizontal, 20)
            VStack(spacing: 30) {
                HStack {
                    Text(pokemonViewModel.pokemon?.description ?? "")
                }
                
                HStack(){
                    
                    VStack {
                        Text("Height")
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        
                        Text("\(pokemonViewModel.pokemon?.height ?? 0) cm")
                            .foregroundColor(pokemonViewModel.pokemon?.types.first?.color())
                            .fontWeight(.bold)
                    }
                
                    Spacer()
                    
                    VStack {
                        Text("Weight")
                            .foregroundColor(.black)
                            .padding(.bottom, 10)
                        
                        Text("\(String(format: "%.2f", (pokemonViewModel.pokemon?.weight ?? 0))) kg")
                            .foregroundColor(pokemonViewModel.pokemon?.types.first?.color())
                            .fontWeight(.bold)
                    }
                    
                    
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
                .background(.white)
                .cornerRadius(16)
                .shadow(color: Color("ShadowColor"), radius: 4, x: -2, y: 2)
                
                
                Spacer()
            }
            .padding(.all, 20)
            .background(.white)
            .cornerRadius(12)
        }
        .background(pokemonViewModel.pokemon?.types.first?.color() ?? Color("GreyColor"))
        .onAppear(){
            pokemonViewModel.getPokemon(id: pokemonId)
        }
        .toolbar{
            Image(systemName: "heart")
                .foregroundColor(.white)
        }
    }

}

struct PokemonView_Previews: PreviewProvider {

    
    
    static var previews: some View {
        
        
        PokemonView(pokemonId: 1)
    }
}
