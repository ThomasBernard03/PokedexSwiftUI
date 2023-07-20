//
//  Constants.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation
import SwiftUI


struct Constants {
    
    static let pokeAPIBaseUrl = "https://pokeapi.co/api/v2/"
    static let pokemonsJSONFilePath = "Pokemons"
    
    
    
    struct Colors {
        static let grassColor = Color("GrassColor")
        static let fireColor = Color("FireColor")
        static let waterColor = Color("WaterColor")
        static let electricColor = Color("ElectricColor")
    }
    
    struct Images {
        static let pokeballBackground = Image("PokeballBackground")
    }
}
