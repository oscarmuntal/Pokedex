//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol PokemonDetailViewInterface {
}

//MARK: PokemonDetailView Class
final class PokemonDetailView: UserInterface {
}

//MARK: - Public interface
extension PokemonDetailView: PokemonDetailViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension PokemonDetailView {
    var presenter: PokemonDetailPresenter {
        return _presenter as! PokemonDetailPresenter
    }
    var displayData: PokemonDetailDisplayData {
        return _displayData as! PokemonDetailDisplayData
    }
}
