//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation


class PokemonViewModel : ObservableObject {
    
    @Published var pokemon : Pokemon? = nil
    
    let apiService = APIService()
    let jsonService = JsonService()
    
    
    func getPokemon(id : Int){
        
        apiService.fetchResource(url: "\(Constants.pokeAPIBaseUrl)pokemon/\(id)") { (response : PokemonAPIResponse?) in
            
            if response != nil {
                DispatchQueue.main.async {
                    self.pokemon = Pokemon(from: response!)
                }
            }
        }
        
    }
    
}
