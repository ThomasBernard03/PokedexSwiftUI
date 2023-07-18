//
//  PokemonView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon : Pokemon
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack {
            
            VStack {
                VStack {
                    HStack {
                        Text("#\(String(format: "%03d", pokemon.id))")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Bulbasaur")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack {
                        ForEach(pokemon.types, id: \.self) { type in
                            PokemonTypeItemView(type: type)
                        }
                        
                        Spacer()
                    }

                    AsyncImage(url: URL(string:pokemon.sprites.frontDefaultOfficialArtwork ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        Image("Pokeball")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    }
                }
                .padding(.all, 20)
                
                
                VStack {
                    Picker("", selection: $selectedTab) {
                        Text("About").tag(0)
                        Text("Stats").tag(1)
                        Text("Evolution").tag(2)
                        Text("Moves").tag(3)
                        // Add more tabs as you wish
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    
                    // Tab content here...
                    VStack {
                        switch selectedTab {
                        case 0:
                            PokemonAboutView(
                                description: pokemon.description,
                                height: pokemon.height,
                                weight: pokemon.weight
                            )
                        case 1:
                            Text("Tab 2 Content")
                        default:
                            Text("Default Content")
                        }
                        
                        Spacer()
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight : .infinity)
                .padding(.all, 20)
                .background()
                .cornerRadius(20)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top, 80)
        .background(pokemon.types.first?.color())
        .edgesIgnoringSafeArea(.all)
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
            )
        )
        
        PokemonView(pokemon: bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}



