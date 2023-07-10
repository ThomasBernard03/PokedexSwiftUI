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
                            Text(type.rawValue)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                .background(Color("TypeBackgroundColor"))
                                .cornerRadius(12)
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
                    HStack {
                        Text(pokemon.description)
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
            description: "",
            height: 0,
            weight: 0,
            sprites: PokemonSprites(
                frontDefaultOfficialArtwork: "", frontShinyOfficialArtwork: "", frontMaleDreamWorld: "", frontFemaleDreamWorld: ""
            )
        )
        
        PokemonView(pokemon: bulbasaur)
            .previewLayout(.sizeThatFits)
    }
}



