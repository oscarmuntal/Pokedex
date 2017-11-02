//
//  SearchPokemonView.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol SearchPokemonViewInterface {
}

//MARK: SearchPokemonView Class
final class SearchPokemonView: UserInterface {

    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchPokemon()
    }
}

//MARK: - Public interface
extension SearchPokemonView: SearchPokemonViewInterface {
    func fetchPokemon() {
        presenter.fetchPokemon(updateUI: { pokemon in
            //TO DO 
            print("pokemon: \(pokemon)")
        }) { () -> (Void) in
            
        }
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SearchPokemonView {
    var presenter: SearchPokemonPresenter {
        return _presenter as! SearchPokemonPresenter
    }
    var displayData: SearchPokemonDisplayData {
        return _displayData as! SearchPokemonDisplayData
    }
}
