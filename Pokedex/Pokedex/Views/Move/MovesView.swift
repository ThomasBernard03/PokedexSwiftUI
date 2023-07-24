//
//  MovesView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 24/07/2023.
//

import SwiftUI

struct MovesView: View {
    
    private var moves : [Move] = MoveViewModel().getMoves()
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 10) {
            
            TextField("Search a move", text: $searchText)
                .disableAutocorrection(true)
                .padding(16)
                .padding(.horizontal, 45)
                .background(Color(.systemGray6))
                .cornerRadius(40)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("DarkGreyColor"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        
                    }
                )
                .padding(.horizontal, 20)
            
            
            ScrollView {
                LazyVStack {
                    ForEach(moves.filter {searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())}) { move in
                        MoveItemView(move: move)
                    }

                }
                .padding(.all, 20)
            }

        }
        .navigationTitle("Moves")
        .onAppear(){
            
        }
    }
}

struct MovesView_Previews: PreviewProvider {
    static var previews: some View {
        MovesView()
    }
}
