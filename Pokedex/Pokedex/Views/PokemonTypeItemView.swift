//
//  PokemonTypeItemView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 12/07/2023.
//

import SwiftUI

struct PokemonTypeItemView: View {
    
    let type: PokemonType
    
    var body: some View {
        Text(type.rawValue)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(Color("TypeBackgroundColor"))
            .cornerRadius(12)
    }
}

struct PokemonTypeItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypeItemView(type:PokemonType.bug)
    }
}
