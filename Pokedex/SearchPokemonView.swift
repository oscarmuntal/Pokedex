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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var searchingLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        fetchPokemon()
    }
    
    func setupUI(_ pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        heightLabel.text = "Height: \(pokemon.height)"
        weightLabel.text = "Height: \(pokemon.weight)"
    }
}

//MARK: - Public interface
extension SearchPokemonView: SearchPokemonViewInterface {
    
    
    func fetchPokemon() {
        self.showLoader()
        presenter.fetchPokemon(updateUI: { pokemon in
            self.setupUI(pokemon)
            self.hideLoader()
            
        }) { () -> (Void) in
            
        }
    }
    
    func showLoader() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        disableButtons()
        showSearchingLabel()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        enableButtons()
        hideSearchingLabel()
    }
    
    func showSearchingLabel() {
        searchingLabel.isHidden = false
    }
    
    func hideSearchingLabel() {
        searchingLabel.isHidden = true
    }
    
    func disableButtons() {
        cancelButton.isEnabled = false
        saveButton.isEnabled = false
    }
    
    func enableButtons() {
        cancelButton.isEnabled = true
        saveButton.isEnabled = true
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
