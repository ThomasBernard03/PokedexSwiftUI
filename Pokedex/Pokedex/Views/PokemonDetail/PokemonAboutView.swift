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
    
    var body: some View {
        VStack {
            Text(description)
                .multilineTextAlignment(.center)
            
            HStack {
                
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Height")
                    }
                    
                    HStack {
                        Text("\(height) cm")
                    }
                    
                }
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image(systemName: "scalemass")
                        Text("Weight")
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
            
            
            
        }
        .padding(.all, 10)
        .padding(.bottom, 0)
    }
}

struct PokemonAboutView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonAboutView(
            description: "A strange seed was planted on its back at birth.The plant sprouts and grows with this POKéMON",
            height: 70, weight: 6.9
        ).previewLayout(.sizeThatFits)
        
    }
}
