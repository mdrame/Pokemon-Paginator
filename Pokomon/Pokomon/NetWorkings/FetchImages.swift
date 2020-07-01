//
//  FetchImages.swift
//  Pokomon
//
//  Created by Mohammed Drame on 7/1/20.
//  Copyright © 2020 MO. All rights reserved.
//

import Foundation
import UIKit


class FetchPokemonImage {
    
    func fetchImageFrom(url: String, decodedData: @escaping (_:PokemonImage)->Void) {
        let url = URL(string: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url!) { (data, respose, error) in
            if error != nil { print("Error occured while retriving data")
                return }
            guard let httpResponse = respose as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("RESPONSE CODE: 200")
                return }
            guard let encodedDatata = data else { "0 data after call"
                return }
            let pokemonImage = self.decode(data: encodedDatata)
            decodedData(pokemonImage!)
        }
        dataTask.resume()
    }
    
    
    
    func decode(data: Data?)->PokemonImage? {
        let jsonDecoder = JSONDecoder()
        do {
            let decodedData = try jsonDecoder.decode(SpecificPokemon.self, from: data!)
            let pokemonImage = decodedData.sprites
            return pokemonImage
        } catch {
            print("Unable to decode json")
        }
        return nil
    }
    
    
    
}
