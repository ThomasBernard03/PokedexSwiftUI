//
//  MoveStatItemView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 23/07/2023.
//

import SwiftUI

struct MoveStatItemView: View {
    
    let name : String
    let value : String
    
    var body: some View {
        
        HStack {
            Text(name)
                .fontWeight(.bold)
            
            Text(value)
        }
        .padding(.all, 5)
        .background(Constants.Colors.greyColor)
        .cornerRadius(5)
    }
}

struct MoveStatItemView_Previews: PreviewProvider {
    static var previews: some View {
        MoveStatItemView(name: "name", value: "value")
    }
}
