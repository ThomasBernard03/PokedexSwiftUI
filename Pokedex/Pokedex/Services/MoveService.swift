//
//  MoveService.swift
//  Pokedex
//
//  Created by Thomas Bernard on 23/07/2023.
//

import Foundation

class MoveService {
    private let jsonService = JsonService()
    
    
    func getMoves() -> [Move] {
        let moves : [Move]? = jsonService.readJsonFile(jsonPathFile: Constants.movesJSONFilePath)
        
        if moves != nil {
            return moves!
        }
        
        return []
    }
}
