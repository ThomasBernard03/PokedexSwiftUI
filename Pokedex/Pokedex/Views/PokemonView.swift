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
                    VStack {
                        HStack {
                            Button(action: {
                                selectedTab = 0
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(selectedTab == 0 ? Color.black : Color("LightGreyColor") )
                                Text("About")
                                    .foregroundColor(selectedTab == 0 ? Color.black : Color("LightGreyColor") )
                            }
                            
                            Button(action: {
                                selectedTab = 1
                            }) {
                                Image(systemName: "chart.bar.fill")
                                    .foregroundColor(selectedTab == 1 ? Color.black : Color("LightGreyColor") )
                                Text("Stats")
                                    .foregroundColor(selectedTab == 1 ? Color.black : Color("LightGreyColor") )
                            }
                            
                            Button(action: {
                                selectedTab = 2
                            }) {
                                Image(systemName: "chevron.left.2")
                                    .foregroundColor(selectedTab == 2 ? Color.black : Color("LightGreyColor"))
                                    .rotationEffect(Angle(degrees: 90))
                                Text("Stats")
                                    .foregroundColor(selectedTab == 2 ? Color.black : Color("LightGreyColor") )
                            }
                            
                            Button(action: {
                                selectedTab = 3
                            }) {
                                Image(systemName: "hand.raised")
                                    .foregroundColor(selectedTab == 3 ? Color.black : Color("LightGreyColor"))
                                Text("Moves")
                                    .foregroundColor(selectedTab == 3 ? Color.black : Color("LightGreyColor") )
                            }
                        }
                        
                        if selectedTab == 0 {
                            VStack{
                                Text("Contenu de l'onglet 1")
                                HStack{
                                    Spacer()
                                }
                                Spacer()
                            }
                            
                        } else {
                            VStack{
                                Text("Contenu de l'onglet 2")
                                HStack{
                                    Spacer()
                                }
                                Spacer()
                            }
                            
                        }
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



