//
//  FetchData.swift
//  Pokomon
//
//  Created by Mohammed Drame on 6/29/20.
//  Copyright © 2020 MO. All rights reserved.
//

import Foundation
import UIKit

//protocol DecodedData {
//    func object(data: [Pokemon])
//}


class FetchData {
  
    // catch established
     let catchImages = NSCache<NSString, UIImage>()
    
    
//    var objectDelegate: DecodedData!
    
    func fetchPokomon(urlValue: String, completion: @escaping (_ : [Pokemon])-> Void) {
        if let url = URL(string: urlValue) {
            let urlRequest = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlRequest) { (data, respond, error) in
               
                if error != nil {
                    print(error?.localizedDescription)
                }
                guard let httpRespond = respond as? HTTPURLResponse, httpRespond.statusCode == 200 else { return }
                
                guard let data = data else { return }
                let listOfDedodedJson = self.decodedJSON(data: data)
               
                DispatchQueue.main.async {
//                    self.objectDelegate.object(data: listOfDedodedJson)
                    completion(listOfDedodedJson)
                    
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
