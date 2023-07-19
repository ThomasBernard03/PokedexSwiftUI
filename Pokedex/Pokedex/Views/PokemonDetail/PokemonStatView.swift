//
//  PokemonStatView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 19/07/2023.
//

import SwiftUI
struct PokemonStatView: View {
    
    let stats : [PokemonStat]
    @State private var progress = 0.0
    
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
                        ProgressView(value: Float(progress) * Float(stat.value), total: 200)
                            .tint(Color("FireColor"))
                            .progressViewStyle(LinearProgressViewStyle())
                    }
                }
            }
        }
        .padding(.all, 10)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(.easeInOut(duration: 2)) {
                    progress = 1.0
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
