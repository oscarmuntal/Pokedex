//
//  PokemonDetailRouter.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import Viperit

class PokemonDetailRouter: Router {
    
    func showPokemonDetail(pokemon: Pokemon, fromVC: UIViewController) {
        presenter.pokemon = pokemon
        guard let vc = self.presenter._view else { return }
        fromVC.show(vc, sender: nil)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension PokemonDetailRouter {
    var presenter: PokemonDetailPresenter {
        return _presenter as! PokemonDetailPresenter
    }
}
