//
//  SpeciesAPIResponse.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation


struct SpeciesAPIResponse : Decodable {
    
    let flavor_text_entries : [SpeciesFlavorTextEntryAPIResponse]
    
    
    struct SpeciesFlavorTextEntryAPIResponse : Decodable {
        let flavor_text : String
        let language : SpeciesFlavorTextEntryLanguageAPIResponse
        
        struct SpeciesFlavorTextEntryLanguageAPIResponse : Decodable {
            let name : String
        }
    }
}
