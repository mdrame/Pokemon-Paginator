//
//  FetchData.swift
//  Pokomon
//
//  Created by Mohammed Drame on 6/29/20.
//  Copyright © 2020 MO. All rights reserved.
//

import Foundation

protocol DecodedData {
    func object(data: [Pokemon])
}


class FetchData {
  
    
    var objectDelegate: DecodedData!
    
    func fetchPokomon(urlValue: String){
        if let url = URL(string: urlValue) {
            let urlRequest = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlRequest) { (data, respond, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }
                
                guard let data = data else { return }
                let listOfDedodedJson = self.decodedJSON(data: data)
//                print(listOfDedodedJson)
                DispatchQueue.main.async {
                    self.objectDelegate.object(data: listOfDedodedJson)
                }
                
               
                
            }
            task.resume()
            
        }
      
       
    }
    
    
    func decodedJSON(data: Data?)->[Pokemon]{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Result.self , from: data!)
            let pokemonObject = decodedData.results
            return pokemonObject
        }
        catch {
            print("Retrive data unable to decode 📡❌")
        }
        return []
    }
    
    
    
    
    
    
    
    
}
