//
//  Move.swift
//  Pokedex
//
//  Created by Thomas Bernard on 23/07/2023.
//

import Foundation

struct Move : Decodable, Identifiable {
    let id : Int
    let name : String
    let type : Type
    let description : String
    let power : Int?
    let accuracy : Int?
    let pp : Int
    let priority : Int
    let damageClass : String
    let target : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case description
        case power
        case accuracy
        case pp
        case priority
        case damageClass = "damage_class"
        case target
    }
}
