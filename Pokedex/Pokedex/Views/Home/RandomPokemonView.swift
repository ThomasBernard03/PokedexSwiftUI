//
//  RandomPokemonView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import SwiftUI

struct RandomPokemonView: View {
    
    let pokemon : Pokemon
    
    var body: some View {
        
        ZStack {
            pokemon.types.first?.color()
                .cornerRadius(20)
            
            ZStack {
                VStack {
                    HStack {
                        Text("Random pokemon")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    HStack {
                        Text("#\(String(format: "%03d", pokemon.id))")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    HStack {
                        Text(pokemon.name)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                    }

                    
                    
                    Spacer()
                }
                .padding(.all, 20)
                
                ZStack {
                    
                    Constants.Images.pokeballBackground
                        .resizable()
                        .frame(width: 220, height: 220)
                        .offset(x:100, y: 100)
                    
                    
                    VStack {
                        AsyncImage(url: URL(string: pokemon.sprites.frontDefaultOfficialArtwork ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                        } placeholder: { ProgressView()}
                        
                        Text(pokemon.name)
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(.white)
                            
                    }
                }


            }
            

            

        }
        
    }
}

struct RandomPokemonView_Previews: PreviewProvider {
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
            baseHappiness: 46,
            shape: "quadriped",
            evolutionChain: PokemonEvolutionChain(pokemonId: 1, level: nil, item: nil, evolutionChain: nil)
        )
        
        
        RandomPokemonView(pokemon: bulbasaur).previewLayout(.sizeThatFits)
    }
}
