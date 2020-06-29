//
//  ViewController.swift
//  Pokomon
//
//  Created by MO on 6/28/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Instances
    let networkingModel =  FetchData()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkingModel.fetchPokomon(urlValue: "https://pokeapi.co/api/v2/pokemon?limit=10")
        
        print("View already loaded")
    }
        
        
        

    
    
    
        
    }
    
    

    
    
    
    
    



