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
        self.presenter.saveButtonAction(onSuccess: { () -> (Void) in
            showSuccessAlert()
        }) { () -> (Void) in
            showFailAlert()
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        fetchPokemon()
    }
    
    func setupUI(_ pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        heightLabel.text = "Height: \(pokemon.height)"
        weightLabel.text = "Height: \(pokemon.weight)"
        setImage(pokemon.image)
    }
}

//MARK: - Public interface
extension SearchPokemonView: SearchPokemonViewInterface {
    
    func setImage(_ url: String) {
        pokemonImage.image = UIImage(named: "placeholder_image")
        pokemonImage.contentMode = .center
        pokemonImage.backgroundColor = UIColor.lightGray
        pokemonImage.sd_setImage(with: URL(string: url), completed: { [weak self] (image, error, cacheType, url) in
            self?.pokemonImage.contentMode = .scaleAspectFill
        })
    }
    
    func fetchPokemon() {
        self.showLoader()
        presenter.fetchPokemon(updateUI: { pokemon in
            self.setupUI(pokemon)
            self.hideLoader()
            self.checkIsRepeated(pokemon)
        }) { () -> (Void) in
            self.showFailAlert()
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
    
    func showSuccessAlert(){
        showAlert(message: displayData.successMessage, okButton: displayData.okButton, cancelButton: displayData.cancelButton)
    }
    
    func showFailAlert() {
        showAlert(message: displayData.failMessage, okButton: displayData.okButton, cancelButton: displayData.cancelButton)
        
    }
    
    func showRepeatedPokemonAlert() {
        showAlert(message: displayData.repeatedPokemonMessage, okButton: displayData.okButton, cancelButton: displayData.cancelButton)
    }
    
    func showAlert(message: String, okButton: String, cancelButton: String) {
        let alertController = UIAlertController(title: message, message:
            "", preferredStyle: UIAlertControllerStyle.alert)
        
        
        alertController.addAction(UIAlertAction(title: okButton, style: UIAlertActionStyle.default,handler: { (action: UIAlertAction!) in
            self.fetchPokemon()
        }))
        
        alertController.addAction(UIAlertAction(title: cancelButton, style: UIAlertActionStyle.default,handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func checkIsRepeated(_ pokemon: Pokemon) {
        for myPokemon in presenter.backPackRealm.pokemons {
            if myPokemon.id == pokemon.id {
                showRepeatedPokemonAlert()
            }
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
