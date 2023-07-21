//
//  ItemService.swift
//  Pokedex
//
//  Created by Thomas Bernard on 21/07/2023.
//

import Foundation


class ItemService {
    
    private let jsonService = JsonService()


    func getItems() -> [Item] {
        
        let items : [Item]? = jsonService.readJsonFile(jsonPathFile: Constants.itemsJSONFilePath)
        
        if items != nil {
            return items!
        }
        
        return []
    }
    
    
}
