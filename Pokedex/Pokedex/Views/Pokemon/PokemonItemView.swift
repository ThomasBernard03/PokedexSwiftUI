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
        ZStack {
            pokemon.types.first?.color()
            
            Constants.Images.pokeballBackground
                .resizable()
                .frame(width: 200, height: 200)
                .offset(x:140, y:60)
            
            Constants.Images.pokeballBackground
                .resizable()
                .frame(width: 200, height: 200)
                .offset(x:-200, y:-100)
            
            AsyncImage(url: URL(string: pokemon.sprites.frontDefaultOfficialArtwork ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            } placeholder: { ProgressView()}
                .offset(x:100, y:30)
            
            VStack {
                HStack {
                    Spacer()
                    Text("#\(String(format: "%03d", pokemon.id))")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(.top, 20)
                }
                
                HStack {
                    Text(pokemon.name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
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
            .padding(.horizontal, 30)
            
            
        }
        .cornerRadius(40)
        .frame(height: 200)

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
