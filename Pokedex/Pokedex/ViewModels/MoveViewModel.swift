//
//  MoveViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 24/07/2023.
//

import Foundation

class MoveViewModel {
    
    private let moveService = MoveService()


    func getMoves() -> [Move] {
    
        return moveService.getMoves()
    }
}
