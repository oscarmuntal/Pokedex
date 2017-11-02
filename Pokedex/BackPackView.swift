//
//  BackPackView.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol BackPackViewInterface {
}

//MARK: BackPackView Class
final class BackPackView: UserInterface {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyListLabel: UILabel!
    
    @IBAction func searchButtonAction(_ sender: Any) {
    
    }
    
    let reuseIdentifier = "cell"
}


extension BackPackView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TO DO
    }
    
}

extension BackPackView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //TO DO
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        return cell
    }
    
}

//MARK: - Public interface
extension BackPackView: BackPackViewInterface {
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
