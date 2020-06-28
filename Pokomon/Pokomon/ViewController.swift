//
//  ViewController.swift
//  Pokomon
//
//  Created by MO on 6/28/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/ditto")
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url!) { (data, respond, error) in
            if error != nil {
                print(error as Any)
                return
        }
            print(data as Any)
           
        }
         task.resume()
    }
        
        
        

    
    
    
        
    }
    
    

    
    
    
    
    



