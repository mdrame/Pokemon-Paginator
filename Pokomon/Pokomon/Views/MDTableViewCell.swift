//
//  MDTableViewCell.swift
//  Pokomon
//
//  Created by Mohammed Drame on 6/29/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit
import Foundation

@available(iOS 13.0, *)
class MDTableViewCell: UITableViewCell {
    
    
    static let cellIdentifier = "pokemonCell"
                                                            
    
    
         
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // Update tableview using this protocle
    func pokemonObject(object: Pokemon) {
        textLabel?.text = object.name
        print(object.url)

//        imageView?.image = UIImage(named: "thumbOne.jpg")
   
    }
    
    
    
    
}








