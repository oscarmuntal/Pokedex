//
//  BackPackRealm.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class BackPackRealm: Object {
    
    dynamic var id = 1
    var pokemons = List<Pokemon>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func savePokemon(_ pokemon: Pokemon) -> Bool {
        do {
            let realm = try Realm()
            
            try realm.write {
                let newPokemonRealm = realm.create(Pokemon.self, value: pokemon, update: false)
                if !self.pokemons.contains(newPokemonRealm) {
                    self.pokemons.append(newPokemonRealm)
                }
            }
            
            try realm.write {
                realm.create(BackPackRealm.self, value: self, update: true)
            }
            return true
        }
        catch {
            return false
        }
    }
}
