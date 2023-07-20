//
//  ItemsView.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import SwiftUI

struct ItemsView: View {
    
    private var items : [Item] = ItemsViewModel().getItems()
    @State private var searchText = ""
    
    var body: some View {
        VStack(spacing: 10) {
            
            TextField("Search an item", text: $searchText)
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
                    ForEach(items.filter {searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())}) { item in
                        ItemItemView(item: item)
                    }

                }
                .padding(.all, 20)
            }

        }
        .navigationTitle("Items")
        .onAppear(){
            
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
