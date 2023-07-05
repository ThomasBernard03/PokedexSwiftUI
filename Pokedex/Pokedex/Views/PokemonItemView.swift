//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonItemView: View {
    
    let pokemon : PokemonListItem
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Text("#\(String(format: "%03d", pokemon.id))")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            ZStack {
                
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string:pokemon.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                    } placeholder: {
                        Image("Pokeball")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                    }
                }

                
                VStack {
                    HStack {
                        Text(pokemon.name)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack {
                        VStack {
                            ForEach(pokemon.types, id: \.self) { type in
                                HStack {
                                    Text(type.rawValue)
                                        .foregroundColor(.white)
                                        .padding(.all, 10)
                                        .background(pokemon.types.first?.lightColor() ?? Color("GreyColor"))
                                        .cornerRadius(12)
                                    Spacer()
                                }
                            }
                        }
  
                        
                        Spacer()
                    }

                    
                    Spacer()
                }
            }

            

            
        }
        .padding(.all, 12)
        .frame(height: 180)
        .background(pokemon.types.first?.color() ?? Color("GreyColor"))
        .cornerRadius(26)
    }
}

struct PokemonItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let bulbasaur = PokemonListItem(
            id: 1,
            name: "Bulbasaur",
            types: [.grass, .poison]
        )
        
        let ivysaur = PokemonListItem(
            id: 2,
            name: "Yvysaur",
            types: [.grass, .poison]
        )
        
        VStack {
            PokemonItemView(pokemon:bulbasaur).previewLayout(.sizeThatFits)
            PokemonItemView(pokemon:ivysaur).previewLayout(.sizeThatFits)
        }.padding(.all, 18)
    }
}
