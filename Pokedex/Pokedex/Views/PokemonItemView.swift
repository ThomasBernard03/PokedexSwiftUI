//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonItemView: View {
    
    let pokemon : Pokemon
    
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
                    AsyncImage(url: URL(string: pokemon.sprites.frontDefaultOfficialArtwork ?? "")) { image in
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
                                    PokemonTypeItemView(type: type)
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
        
        let bulbasaur = Pokemon(
            id: 1,
            name: "Bulbasaur",
            types: [.grass, .poison],
            description: "",
            height: 0,
            weight: 0,
            sprites: PokemonSprites(
                frontDefaultOfficialArtwork: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", frontShinyOfficialArtwork: ""
            ),
            stats: [PokemonStat](),
            abilities: [],
            growthRate: "medium",
            captureRate : 28,
            baseHappiness: 46
        )

        
        VStack {
            PokemonItemView(pokemon:bulbasaur).previewLayout(.sizeThatFits)
        }.padding(.all, 18)
    }
}
