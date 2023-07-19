//
//  PokemonStatView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 19/07/2023.
//

import SwiftUI

struct PokemonStatView: View {
    
    let stats : [PokemonStat]
    
    var body: some View {
        
        VStack {
            ForEach(stats, id: \.self) { stat in
                HStack {
                    HStack {
                        Text(stat.name)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("\(stat.value)")
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        ProgressView(value: Float(stat.value), total: 100)
                            .tint(Color("FireColor"))
                            .progressViewStyle(LinearProgressViewStyle())
                    }
                }
            }
        }
    }
}

struct PokemonStatView_Previews: PreviewProvider {
    static var previews: some View {
        
        let stats = [
            PokemonStat(name: "hp", value: 45),
            PokemonStat(name: "attack", value: 28),
        ]
    
        
        
        PokemonStatView(stats: stats)
            .previewLayout(.sizeThatFits)
    }
}
