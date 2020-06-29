//
//  ViewController.swift
//  Pokomon
//
//  Created by MO on 6/28/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DecodedDataListOfObject {
    
    
    
    
    // MARK: Instances
    let networkingModel = FetchData()
    
    
    // Update UI using this protocle
    func pokemonObject(object: [Pokemon]) {
        for pokemons in object {
            print("Pokemon Name: \(pokemons.name)")
            print("URL: \(pokemons.url)")
        }
    }
    
    // MARK: Protocol delegate set
    func NetworkingProtocle() {
        networkingModel.pokemonDataFromNetworkingLayer = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkingModel.fetchPokomon(urlValue: "https://pokeapi.co/api/v2/pokemon?limit=100")
        NetworkingProtocle()
        
    }
    
    
    
}











