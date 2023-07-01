//
//  PokemonType.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation
import SwiftUI


enum PokemonType : String, Decodable {
    case fire, grass, water, poison, flying, bug, normal, electric, ground, fairy, fighting, dragon, steel, rock, ice, psychic, ghost, dark
}

extension PokemonType {
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
        
        default:
            return Color("GreyColor") // Une couleur par défaut pour les cas non gérés
        }
    }
    
    func lightColor() -> Color {
        switch self {
        case .fire:
            return Color("FireLightColor")
        case .grass:
            return Color("GrassLightColor")
        case .water:
            return Color("WaterLightColor")
        case .electric:
            return Color("ElectricLightColor")
        
        default:
            return Color("GreyColor") // Une couleur par défaut pour les cas non gérés
        }
    }
}

