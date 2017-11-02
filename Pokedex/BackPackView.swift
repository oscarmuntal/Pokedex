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
