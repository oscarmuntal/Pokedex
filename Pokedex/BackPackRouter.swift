//
//  BackPackRouter.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import Viperit

class BackPackRouter: Router {
    
    func showPokemonDetail(pokemon: Pokemon) {
        guard let detailRouter = AppModules.PokemonDetail.build().router as? PokemonDetailRouter,
            let vc = self.presenter._view else { return }
        
        detailRouter.showPokemonDetail(pokemon: pokemon, fromVC: vc)
    }
    
    func searchPokemon() {
        guard let searchRouter = AppModules.SearchPokemon.build().router as? SearchPokemonRouter,
            let vc = self.presenter._view else { return }
        
        searchRouter.searchPokemon(fromVC: vc, backPackRealm: presenter.backPackRealm)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension BackPackRouter {
    var presenter: BackPackPresenter {
        return _presenter as! BackPackPresenter
    }
}
