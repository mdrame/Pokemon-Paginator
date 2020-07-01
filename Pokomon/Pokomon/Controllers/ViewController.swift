//
//  ViewController.swift
//  Pokomon
//
//  Created by MO on 6/28/20.
//  Copyright © 2020 MO. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
@available(iOS 13.0, *)
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingViews()
        //        networkingModel.objectDelegate = self
        networkingModel.fetchPokomon(urlValue: "https://pokeapi.co/api/v2/pokemon?limit=10") { (listOfPokemons) in
            self.list = listOfPokemons
        }
    }
    
    
    
    // MARK: Instances
    let networkingModel = FetchData()
    

    // MARK: UIKit view
    func addingViews() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        view.addSubview(mainTableView)
        mainTableViweConstrain()
    }
    
    
    // protocol implimentations
    var list: [Pokemon] = [] {
        didSet {
            mainTableView.reloadData()
        } willSet {
            mainTableView.reloadData()
        }
    }
    //    func object(data: [Pokemon]) {
    //        list = data
    //        mainTableView.reloadData()
    //    }
    
    
    
    
    
    
    
    
    // mainTableViwe
    
    lazy var mainTableView: UITableView = {
        let mainTableViwe = UITableView(frame: .zero)
        mainTableViwe.translatesAutoresizingMaskIntoConstraints = false
        mainTableViwe.register(MDTableViewCell.self, forCellReuseIdentifier: MDTableViewCell.cellIdentifier)
        mainTableViwe.rowHeight = CGFloat(100)
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
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MDTableViewCell.cellIdentifier, for: indexPath) as! MDTableViewCell
        //        cell.textLabel?.text = "dfghj"
        cell.pokemonObject(object: list[indexPath.row])
        print("in cell \(list)")
        return cell
    }
    
    
    
    
    
}











