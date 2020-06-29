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

