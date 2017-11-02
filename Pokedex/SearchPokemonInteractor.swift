//
//  SearchPokemonInteractor.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import Viperit

class SearchPokemonInteractor: Interactor {
    
    func getPokemon(id: Int, successBlock: @escaping RequestSuccessBlock, errorBlock:@escaping RequestErrorBlock) {
        let path = ""
        ApiManager.sharedInstance.get(path: path.getApiEndpointPath(type: .kAPI_ENDPOINT_GET_POKEMON) + "\(id)", parameters: nil, successBlock: { response in
            
            if let response = response {
                successBlock(response)
            }
            
        }) { error in
            errorBlock(error)
        }
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension SearchPokemonInteractor {
    var presenter: SearchPokemonPresenter {
        return _presenter as! SearchPokemonPresenter
    }
}
