//
//  PokemonAboutView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 13/07/2023.
//

import SwiftUI

struct PokemonAboutView: View {
    
    let description : String
    let height : Int
    let weight : Float
    let abilities : [String]
    let growthRate : String
    let captureRate : Int
    let baseHappiness : Int
    
    var body: some View {
        VStack {
            Text(description)
                .multilineTextAlignment(.center)
            
            HStack {
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.gray)
                        Text("Height")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        Text("\(height) cm")
                    }
                    
                }
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image(systemName: "scalemass")
                            .foregroundColor(.gray)
                        Text("Weight")
                            .foregroundColor(.gray)
                    }
                    
                    
                    HStack {
                        Text("\(String(format: "%.1f", weight)) kg")
                    }
                    
                }
                
                Spacer()
            }
            .padding(.all, 20)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 2, x: 0, y: 3)
            .padding(.all, 20)
            
            
            HStack {
                Text("And what more ?")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
            }
            
            VStack(spacing: 12) {
                HStack {
                    Text("Abilities")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Spacer()
                    
                    ForEach(abilities, id: \.self) { ability in
                        Text(ability)
                            .padding(.all, 8)
                            .background(Color("GreyColor"))
                            .cornerRadius(5)
                    }
                }
                
                HStack {
                    Text("Growth rate")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Spacer()
                    Text(growthRate)
                }
                
                HStack {
                    Text("Capture rate")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(captureRate)%")
                }
                
                HStack {
                    Text("Base happiness")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(baseHappiness)")
                }
            }
            .padding(.vertical, 10)
            
            
            
        }
        .padding(.all, 10)
        .padding(.bottom, 0)
    }
}

struct PokemonAboutView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonAboutView(
            description: "A strange seed was planted on its back at birth.The plant sprouts and grows with this POKéMON",
            height: 70,
            weight: 6.9,
            abilities: ["Abilities", "Overgrow"],
            growthRate: "medium-slow",
            captureRate: 28,
            baseHappiness: 90
        ).previewLayout(.sizeThatFits)
        
    }
}
