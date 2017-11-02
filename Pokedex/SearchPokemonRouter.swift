//
//  SearchPokemonRouter.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import Viperit

class SearchPokemonRouter: Router {
    
    func searchPokemon(fromVC: UIViewController, backPackRealm: BackPackRealm) {
        presenter.backPackRealm = backPackRealm
        guard let vc = self.presenter._view else { return }
        fromVC.show(vc, sender: nil)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SearchPokemonRouter {
    var presenter: SearchPokemonPresenter {
        return _presenter as! SearchPokemonPresenter
    }
}
