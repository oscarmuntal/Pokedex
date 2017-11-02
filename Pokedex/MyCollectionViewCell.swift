//
//  MyCollectionViewCell.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import SDWebImage

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    func configure(pokemon: Pokemon) {
        myLabel.text = pokemon.name
        setImage(url: pokemon.image)
    }
    
    func setImage(url: String) {
        pokemonImage.image = UIImage(named: "")
        pokemonImage.contentMode = .center
        pokemonImage.backgroundColor = UIColor.lightGray
        
        pokemonImage.sd_setImage(with: URL(string: url), completed: { [weak self] (image, error, cacheType, url) in
            self?.pokemonImage.contentMode = .scaleAspectFill
        })
    }
}
