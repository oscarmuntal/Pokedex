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
}

//MARK: - Public interface
extension SearchPokemonView: SearchPokemonViewInterface {
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
