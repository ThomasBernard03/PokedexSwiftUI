//
//  JsonService.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation



struct JsonService{
    
    func readJsonFile<T:Decodable>(jsonPathFile : String) -> T? {
        do {
            guard let fileURL = Bundle.main.url(forResource: jsonPathFile, withExtension: "json") else {
                fatalError("Can't locate \(jsonPathFile).json file")
            }
            
            let data = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            let myData = try decoder.decode(T.self, from: data)
            
            return myData
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}
