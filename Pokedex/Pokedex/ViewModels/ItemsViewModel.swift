//
//  ItemsViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import Foundation



class ItemsViewModel {
    
    private let itemService = ItemService()


    func getItems() -> [Item] {
    
        return itemService.getItems()
    }
}
