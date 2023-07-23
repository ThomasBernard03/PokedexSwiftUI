//
//  PokemonType.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation
import SwiftUI


enum Type : String, Decodable {
    case fire, grass, water, poison, flying, bug, normal, electric, ground, fairy, fighting, dragon, steel, rock, ice, psychic, ghost, dark
}

extension Type {
    func color() -> Color {
        switch self {
        case .fire:
            return Color("FireColor")
        case .grass:
            return Color("GrassColor")
        case .water:
            return Color("WaterColor")
        case .electric:
            return Color("ElectricColor")
        case .bug:
            return Color("BugColor")
        case .normal:
            return Color("NormalColor")
        case .poison:
            return Color("PoisonColor")
        case .ground:
            return Color("GroundColor")
        case .fighting:
            return Color("FightingColor")
        case .fairy:
            return Color("FairyColor")
        case .dragon:
            return Color("DragonColor")
        case .ice:
            return Color("IceColor")
        case .rock:
            return Color("RockColor")
        case .ghost:
            return Color("GhostColor")
        case .psychic:
            return Color("PsychicColor")
        
        default:
            return Color("GreyColor")
        }
    }
}

