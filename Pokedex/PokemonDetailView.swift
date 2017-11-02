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

//MARK: MyThirdModuleView Class
final class PokemonDetailView: UserInterface {
    
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonDetailsTableView: UITableView!
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var pokemonDetails: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

//MARK: - Public interface
extension PokemonDetailView: PokemonDetailViewInterface {
    
    func setUI() {
        pokemonName.text = presenter.pokemon?.name
        setPokemonDetails()
        guard let image = presenter.pokemon?.image else { return }
        setImage(image)
    }
    
    func setImage(_ url: String) {
        pokemonImage.image = UIImage(named: "placeholder_image")
        pokemonImage.contentMode = .center
        pokemonImage.backgroundColor = UIColor.lightGray
        pokemonImage.sd_setImage(with: URL(string: url), completed: { [weak self] (image, error, cacheType, url) in
            self?.pokemonImage.contentMode = .scaleAspectFill
        })
    }
    
    func setPokemonDetails() {
        var dateLabel = "Date: "
        var timeLabel = "Time: "
        var weightLabel = "Weight: "
        var heightLabel = "Height: "
        var baseExperienceLabel = "Base experience: "
        
        if let date = presenter.pokemon?.date { dateLabel += date }
        if let time = presenter.pokemon?.time { timeLabel += time }
        if let weight = presenter.pokemon?.weight { weightLabel += weight }
        if let height = presenter.pokemon?.height { heightLabel += height }
        if let baseExperience = presenter.pokemon?.baseExperience { baseExperienceLabel += baseExperience }
        
        pokemonDetails.append(dateLabel)
        pokemonDetails.append(timeLabel)
        pokemonDetails.append(weightLabel)
        pokemonDetails.append(heightLabel)
        pokemonDetails.append(baseExperienceLabel)
        
        if let types = presenter.pokemon?.types, types.count > 0 {
            
            pokemonDetails.append("Types:")
            
            for type in types {
                let name = "          \(type.name)"
                pokemonDetails.append(name)
            }
        }
    }
    
}

extension PokemonDetailView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


extension PokemonDetailView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        cell.textLabel?.text = pokemonDetails[indexPath.row]
        return cell
    }
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
