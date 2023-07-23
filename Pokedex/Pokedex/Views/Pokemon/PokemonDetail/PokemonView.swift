//
//  PokemonView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonView: View {
    
    private let pokemonViewModel = PokemonViewModel()
    
    let pokemon : Pokemon
    @State private var selectedTab = 0
    @State private var showShinny =  false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            pokemon.types.first?.color()
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Text("#\(String(format: "%03d", pokemon.id))")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                
                HStack(spacing:15) {
                    Text(pokemon.name)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    Image(systemName: "speaker.wave.3")
                        .foregroundColor(.white)
                        .font(.title3)
                        .onTapGesture {
                            pokemonViewModel.playPokemonSound(id: pokemon.id)
                        }
                    
                    
                    Spacer()
                    
                    Text(pokemon.shape)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                HStack {
                    ForEach(pokemon.types, id: \.self) { type in
                        PokemonTypeItemView(type: type)
                    }
                    
                    Spacer()
                }
            }.padding(20)
            
            ZStack {
                
                Constants.Images.pokeballBackground
                    .resizable()
                    .frame(width: 180, height: 180)
                    .offset(x: 0, y: 20)
                
                
                AsyncImage(url: URL(string:showShinny ? pokemon.sprites.frontShinyOfficialArtwork ?? "" : pokemon.sprites.frontDefaultOfficialArtwork)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            showShinny.toggle()
                        }
                } placeholder: { ProgressView()}
                    
            }
            .offset(x:0, y: 120)
            .zIndex(2)
            
            

            
            VStack {
                
                Picker("", selection: $selectedTab) {
                    Text("About").tag(0)
                    Text("Stats").tag(1)
                    Text("Evolution").tag(2)
                    Text("Moves").tag(3)
                    // Add more tabs as you wish
                }
                .pickerStyle(SegmentedPickerStyle())
                
                
                ScrollView {
                    switch selectedTab {
                    case 0:
                        PokemonAboutView(
                            description: pokemon.description,
                            height: pokemon.height,
                            weight: pokemon.weight,
                            abilities: pokemon.abilities,
                            growthRate: pokemon.growthRate,
                            captureRate: pokemon.captureRate,
                            baseHappiness: pokemon.baseHappiness
                            
                        )
                    case 1:
                        PokemonStatView(stats: pokemon.stats)
                    case 2 :
                        PokemonEvolutionView(evolutionChain: pokemon.evolutionChain)
                    default:
                        Text("Default Content")
                    }
                }
                
            }
            .padding(.top, 40)
            .padding(.horizontal)
            .background(.white)
            .cornerRadius(30)
            .offset(y:280)
            

        }.navigationBarTitleDisplayMode(.inline)
    }
}


struct PokemonView_Previews: PreviewProvider {
        
    static var previews: some View {
        
        let bulbasaur = Pokemon(
            id: 1,
            name: "Bulbasaur",
            types: [.grass, .poison],
            description: "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
            height: 0,
            weight: 0,
            sprites: PokemonSprites(
                frontDefaultOfficialArtwork: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png", frontShinyOfficialArtwork: ""
            ),
            stats: [PokemonStat](),
            abilities: ["overgrow"],
            growthRate: "medium-slow",
            captureRate: 45,
            baseHappiness: 50,
            shape: "quadriped",
            evolutionChain: PokemonEvolutionChain(pokemonId: 1, level: nil, item: nil, evolutionChain: nil)
        )
        
        PokemonView(pokemon: bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}



