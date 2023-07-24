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
            return Constants.Colors.fireColor
        case .grass:
            return Constants.Colors.grassColor
        case .water:
            return Constants.Colors.waterColor
        case .electric:
            return Constants.Colors.electricColor
        case .bug:
            return Constants.Colors.bugColor
        case .normal:
            return Constants.Colors.normalColor
        case .poison:
            return Constants.Colors.poisonColor
        case .ground:
            return Constants.Colors.groundColor
        case .fighting:
            return Constants.Colors.fightingColor
        case .fairy:
            return Constants.Colors.fairyColor
        case .dragon:
            return Constants.Colors.dragonColor
        case .ice:
            return Constants.Colors.iceColor
        case .rock:
            return Constants.Colors.rockColor
        case .ghost:
            return Constants.Colors.ghostColor
        case .psychic:
            return Constants.Colors.psychicColor
        case .dark:
            return Constants.Colors.darkColor
        case .flying:
            return Constants.Colors.flyingColor
        case .steel:
            return Constants.Colors.steelColor
        }
    }
}

extension Type {
    func image() -> Image {
        switch self {
        // Continue here
            
        case .normal:
            return Constants.Images.normalImage
        case .fire:
            return Constants.Images.fireImage
        case .water:
            return Constants.Images.waterImage
        case .electric:
            return Constants.Images.electricImage
        case .grass:
            return Constants.Images.grassImage
        case .ice:
            return Constants.Images.iceImage
        case .fighting:
            return Constants.Images.fightingImage
        case .poison:
            return Constants.Images.poisonImage
        case .ground:
            return Constants.Images.groundImage
        case .flying:
            return Constants.Images.flyingImage
        case .psychic:
            return Constants.Images.psychicImage
        case .bug:
            return Constants.Images.bugImage
        case .rock:
            return Constants.Images.rockImage
        case .ghost:
            return Constants.Images.ghostImage
        case .dragon:
            return Constants.Images.dragonImage
        case .dark:
            return Constants.Images.darkImage
        case .steel:
            return Constants.Images.steelImage
        case .fairy:
            return Constants.Images.fairyImage        
        }
    }
}

