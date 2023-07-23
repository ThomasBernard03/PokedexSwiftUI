//
//  EvolutionChainView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 22/07/2023.
//

import SwiftUI

struct EvolutionChainView: View {
    
    let firstPokemon : Pokemon
    let secondPokemon : Pokemon
    let item : String?
    let level : Int?
    
    var body: some View {
        
        HStack {
            
            ZStack {
                Constants.Images.pokeballBackgroundDark
                    .resizable()
                    .frame(width: 100, height: 100)
                AsyncImage(url: URL(string: firstPokemon.sprites.frontDefaultOfficialArtwork)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                } placeholder: { ProgressView()}
            }
            
            Spacer()
            
            VStack {
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 40, height: 30)
                    .foregroundColor(Constants.Colors.normalColor)
                
                
                if(item != nil){
                    Text(item!)
                        .fontWeight(.bold)
                }
                else {
                    Text("Lvl \(level ?? 0)")
                        .fontWeight(.bold)
                }
            }
            
            Spacer()
            
            ZStack {
                Constants.Images.pokeballBackgroundDark
                    .resizable()
                    .frame(width: 100, height: 100)
                AsyncImage(url: URL(string: secondPokemon.sprites.frontDefaultOfficialArtwork)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                } placeholder: { ProgressView()}
            }
        }
    }
}

struct EvolutionChainView_Previews: PreviewProvider {
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
        
        let ivysor = Pokemon(
            id: 2,
            name: "Ivysor",
            types: [.grass, .poison],
            description: "",
            height: 0,
            weight: 0,
            sprites: PokemonSprites(
                frontDefaultOfficialArtwork: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png", frontShinyOfficialArtwork: ""
            ),
            stats: [PokemonStat](),
            abilities: [],
            growthRate: "medium",
            captureRate : 28,
            baseHappiness: 46,
            shape: "quadriped",
            evolutionChain: PokemonEvolutionChain(pokemonId: 1, level: nil, item: nil, evolutionChain: nil)
        )
        
        EvolutionChainView(firstPokemon: bulbasaur, secondPokemon: ivysor, item: nil, level: 16)
            .previewLayout(.sizeThatFits)
    }
}
