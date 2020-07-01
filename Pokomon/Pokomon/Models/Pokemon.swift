//
//  Pokemon.swift
//  Pokomon
//
//  Created by Mohammed Drame on 6/29/20.
//  Copyright © 2020 MO. All rights reserved.
//

import Foundation


struct Pokemon: Codable {
    var name: String
    var url:String
}

struct Result: Codable {
    var results: [Pokemon]
    var next: String
}

//let list = [Pokemon(name: "Moh", url: "www.h.com",Pokemon(name: "John", url: "www.j.com"))
struct SpecificPokemon: Codable {
    var sprites: PokemonImage
}

struct PokemonImage: Codable {
    var front: String
    var back: String
    
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
        case back = "back_default"
    }
}
