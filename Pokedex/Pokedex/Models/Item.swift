//
//  Item.swift
//  Pokedex
//
//  Created by Thomas Bernard on 20/07/2023.
//

import Foundation


struct Item : Decodable, Identifiable {
    let id : Int
    let name : String
    let category : String
    let cost : Int
    let sprite : String?
    let description : String
}


//{
//    "id": 1,
//    "name": "master-ball",
//    "category": "standard-balls",
//    "cost": 0,
//    "sprite": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/master-ball.png",
//    "description": "The best BALL that catches a POKéMON without fail."
//}
