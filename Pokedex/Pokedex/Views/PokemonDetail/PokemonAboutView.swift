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
            .background(.white)
            .padding(.all, 20)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
        }
        
        
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
