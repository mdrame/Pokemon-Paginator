//
//  ViewController.swift
//  Pokomon
//
//  Created by MO on 6/28/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DecodedDataListOfObject, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
//        networkingModel.fetchPokomon(urlValue: "https://pokeapi.co/api/v2/pokemon?limit=100")
//        NetworkingProtocle()
        
    }
    
    // mainTableViwe
    
    lazy var mainTableView: UITableView = {
        let mainTableViwe = UITableView(frame: .zero)
        mainTableViwe.translatesAutoresizingMaskIntoConstraints = false
//        mainTableViwe.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
//        mainTableViwe.rowHeight = CGFloat(50)
        mainTableViwe.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return mainTableViwe
    }()
    
    // mainTableViwe Constrain
    
    func mainTableViweConstrain() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    
    
    // MARK: Instances
    let networkingModel = FetchData()
    
    
    // Update tableview using this protocle
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
    
    // Creating UIKit view
    func addingViews() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        view.addSubview(mainTableView)
        mainTableViweConstrain()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return UITableViewCell()
    }
    
    
    
    
    
}











