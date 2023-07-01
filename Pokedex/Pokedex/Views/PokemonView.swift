//
//  PokemonView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon : Pokemon
    
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
                    Text("Hello")
                }
                Spacer()
            }
            .background(.white)
            .cornerRadius(12)
        }
        .ignoresSafeArea(.all)
        .background(pokemon.types.first?.color() ?? Color("GreyColor"))
    }
}

struct PokemonView_Previews: PreviewProvider {

    
    
    static var previews: some View {
        let bulbasaur = Pokemon(
            id: 1,
            name: "Bulbasaur",
            types: [.grass, .poison])
        
        
        PokemonView(pokemon: bulbasaur)
    }
}
