//
//  DisplayPokemonViewController.swift
//  Pokomon
//
//  Created by Mohammed Drame on 7/1/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

class DisplayPokemonViewController: UIViewController {
    
    var frontImage: String?
    var backImage: String?
    
    // MARK: Outlets
    @IBOutlet weak var frontUIImageView: UIImageView!
    @IBOutlet weak var backUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setUpImageView(front: String?, back: String?) {
        if let front = front, let back = back {
            frontUIImageView.image = UIImage(named: front)
            backUIImageView.image = UIImage(named: back)
        }
    }
    


}
