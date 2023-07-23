//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Thomas Bernard on 21/07/2023.
//

import Foundation
import SwiftUI
import AVFoundation

class PokemonViewModel {
    
    private var player = AVPlayer()
    private let pokemonService = PokemonService()
    
    
    func playPokemonSound(id : Int) {
        guard let url = URL(string: "https://pokemoncries.com/cries-old/\(id).mp3") else {
            print("Invalid URL")
            return
        }

        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        
        player.play()
    }
    
    func getPokemon(id : Int) -> Pokemon? {
        return pokemonService.getPokemon(id: id)
    }
    
}
