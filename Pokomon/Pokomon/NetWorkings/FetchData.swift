//
//  FetchData.swift
//  Pokomon
//
//  Created by Mohammed Drame on 6/29/20.
//  Copyright © 2020 MO. All rights reserved.
//

import Foundation

class FetchData {
    
    func fetchPokomon(urlValue: String) {
        if let url = URL(string: urlValue) {
            let urlRequest = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlRequest) { (data, respond, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }
                
                guard let data = data else { return }
                self.decodeJSON(data: data)
                print(data)
                
            }
            task.resume()
        }
    }
    
    
    func decodeJSON(data: Data?) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Result.self , from: data!)
            print(decodedData.results)
        } catch {
            print("Retrive data unable to decode 📡❌")
        }
    }
    
    
    
    
    
    
    
    
}
