//
//  BackPackView.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import Viperit
import RealmSwift

//MARK: - Public Interface Protocol
protocol BackPackViewInterface {
}

//MARK: BackPackView Class
final class BackPackView: UserInterface {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyListLabel: UILabel!
    
    @IBAction func searchButtonAction(_ sender: Any) {
        presenter.search()
    }
    
    fileprivate var backPackRealm: Results<BackPackRealm> {
        get {
            let realm = try! Realm()
            let backPack: Results<BackPackRealm> = realm.objects(BackPackRealm.self)
            return backPack
        }
    }
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.initBackPack(backPackRealm.first)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}


extension BackPackView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let backPack = backPackRealm.first else { return }
        
        let sortedPokemons = backPack.pokemons.sorted{
            return $0.order < $1.order
        }
        let pokemon = sortedPokemons[indexPath.row]
        presenter.onPokemonTapped(pokemon: pokemon)
    }
    
}

extension BackPackView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backPackRealm.first?.pokemons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        guard let backPackObject = backPackRealm.first
            else { return UICollectionViewCell() }
        
        let sortedPokemons = backPackObject.pokemons.sorted{
            return $0.order < $1.order
        }
        
        cell.configure(pokemon: sortedPokemons[indexPath.row])
        
        return cell
    }
    
}

//MARK: - Public interface
extension BackPackView: BackPackViewInterface {
    
    func setupUI() {
        emptyListLabel.text = displayData.emptyListText
        emptyListLabel.isHidden = backPackRealm.first?.pokemons.count != 0
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension BackPackView {
    var presenter: BackPackPresenter {
        return _presenter as! BackPackPresenter
    }
    var displayData: BackPackDisplayData {
        return _displayData as! BackPackDisplayData
    }
}
