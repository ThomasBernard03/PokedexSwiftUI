//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import PokemonAPI
import Foundation


class PokemonViewModel : ObservableObject {
    
    @Published var pokemon : Pokemon? = nil
    
    let apiService = APIService()
    let jsonService = JsonService()
    
    
    func getPokemon(id : Int){
    
        
        apiService.fetchResource(url: "\(Constants.pokeAPIBaseUrl)pokemon/\(id)") { (pokemonResponse : PokemonAPIResponse?) in
            
            if pokemonResponse != nil {
                
                self.apiService.fetchResource(url: "\(Constants.pokeAPIBaseUrl)pokemon-species/\(id)") { (speciesResponse : SpeciesAPIResponse?) in
                    
                    if speciesResponse != nil {
                        DispatchQueue.main.async {
                            self.pokemon = Pokemon(from: pokemonResponse!)
                            self.pokemon?.description =
                            speciesResponse!.flavor_text_entries.last(where: { $0.language.name == "en" })?.flavor_text.replacingOccurrences(of: "\n", with: "") ?? ""
                        }
                    }
                }
            }
        }
        
    }
    
}
