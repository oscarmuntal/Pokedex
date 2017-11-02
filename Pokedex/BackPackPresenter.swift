//
//  BackPackPresenter.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import Viperit

class BackPackPresenter: Presenter {
    
    func search() {
        router.searchPokemon()
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension BackPackPresenter {
    var view: BackPackViewInterface {
        return _view as! BackPackViewInterface
    }
    var interactor: BackPackInteractor {
        return _interactor as! BackPackInteractor
    }
    var router: BackPackRouter {
        return _router as! BackPackRouter
    }
}
