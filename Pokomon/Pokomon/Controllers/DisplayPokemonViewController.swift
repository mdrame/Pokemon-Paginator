//
//  DisplayPokemonViewController.swift
//  Pokomon
//
//  Created by Mohammed Drame on 7/1/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

class DisplayPokemonViewController: UIViewController {
    
    var pokemonObject: Pokemon?
    // MARK: Instances
    let fetchPokemonImage = FetchPokemonImage()
    
    // MARK: Outlets
    @IBOutlet weak var frontUIImageView: UIImageView!
    @IBOutlet weak var backUIImageView: UIImageView!
    
    var frontImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    var pokemonImageObject: PokemonImage! {
        didSet {
            self.setUpImageView(imagge: pokemonImageObject)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        title = pokemonObject?.name
        
        fetchPokemonImage.fetchImageFrom(url: pokemonObject!.url) { (ImagObject) in
            print("Pokemon Image URL: \(self.pokemonObject!.url)")
            self.pokemonImageObject = ImagObject
        }
        self.view.addSubview(frontImageView)
        self.view.addSubview(backImageView)
        NSLayoutConstraint.activate([
            frontImageView.topAnchor.constraint(equalTo: view.topAnchor),
            frontImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frontImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frontImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            backImageView.topAnchor.constraint(equalTo: frontImageView.bottomAnchor),
            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        print(title)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    func setUpImageView(imagge pokemon: PokemonImage ) {
        guard let fronturl = URL(string: pokemon.front), let backurl = URL(string: pokemon.back) else { return }
        print(fronturl)
        DispatchQueue.global(qos: .background).async {
            guard let fronturldata = try? Data(contentsOf: fronturl), let backurldata = try? Data(contentsOf: backurl) else { return }
            DispatchQueue.main.async {
                
                self.frontImageView.image = UIImage(data: fronturldata)
                self.backImageView.image = UIImage(data: backurldata)
            }
        }
    }
    
    
    
}
