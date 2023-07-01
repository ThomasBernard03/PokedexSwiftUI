//
//  ApiService.swift
//  Pokedex
//
//  Created by Thomas Bernard on 01/07/2023.
//

import Foundation

struct APIService {

    func fetchResource<T: Decodable>(url: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string:url) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error: \(error!)")
                completion(nil)
                return
            }
            guard let data = data else {
                print("No data found")
                completion(nil)
                return
            }

            let decoder = JSONDecoder()

            do {
                let apiResponse = try decoder.decode(T.self, from: data)
                completion(apiResponse)
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
            }

        }.resume()
    }
}
