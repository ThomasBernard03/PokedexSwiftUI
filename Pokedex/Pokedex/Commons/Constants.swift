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
    static let itemsJSONFilePath = "Items"
    
    
    
    struct Colors {
        static let grassColor = Color("GrassColor")
        static let fireColor = Color("FireColor")
        static let waterColor = Color("WaterColor")
        static let electricColor = Color("ElectricColor")
        static let normalColor = Color("NormalColor")
        
        static let greyColor = Color("GreyColor")
    }
    
    struct Images {
        static let pokeballBackground = Image("PokeballBackground")
        static let pokeballBackgroundDark = Image("PokeballBackgroundDark")
    }
}
