//
//  ItemItemView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import SwiftUI

struct ItemItemView: View {
    
    let item : Item
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text(item.category)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .background(Constants.Colors.normalColor)
                    .cornerRadius(10)
            }
            HStack {
                
                AsyncImage(url: URL(string: item.sprite)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                } placeholder: {
                    ProgressView()
                }
                
                
                VStack {
                    HStack{
                        Text(item.name)
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                            .foregroundColor(Constants.Colors.normalColor)
                            
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(item.cost)$")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    HStack{
                        Text(item.description)
                        Spacer()
                    }
                    
                    
                    
                    
                }
            }
        }
        
        .padding(20)
        
        .background(
            Color.white
                .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 3)
        )
        
        
        
    }
}

struct ItemItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        let item = Item(id: 4, name: "poke-ball", category: "standard-balls", cost: 200, sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png", description: "A tool used for catching wild POKéMON.")
        
        ItemItemView(item:item)
    }
}
