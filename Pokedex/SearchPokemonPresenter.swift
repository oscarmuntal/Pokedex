//
//  SearchPokemonPresenter.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import Viperit

class SearchPokemonPresenter: Presenter {
    
    var pokemon: Pokemon?
    
    func fetchPokemon(updateUI: @escaping ObjectClosure<Pokemon>, failFetchPokemon: @escaping VoidClosure) {
        let id = getPokemonId()
        
        interactor.getPokemon(id: id, successBlock: { response in
            if let response = response {
                let pokemon = Pokemon()
                pokemon.parsePokemon(data: response)
                if pokemon.id != 0 {
                    self.pokemon = pokemon
                    updateUI(pokemon)
                } else {
                    failFetchPokemon()
                }
            } else {
                failFetchPokemon()
            }
        }) { error in
            failFetchPokemon()
        }
    }
    
    func getPokemonId() -> Int {
        return Int(arc4random_uniform(1000)) + 1
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SearchPokemonPresenter {
    var view: SearchPokemonViewInterface {
        return _view as! SearchPokemonViewInterface
    }
    var interactor: SearchPokemonInteractor {
        return _interactor as! SearchPokemonInteractor
    }
    var router: SearchPokemonRouter {
        return _router as! SearchPokemonRouter
    }
}
