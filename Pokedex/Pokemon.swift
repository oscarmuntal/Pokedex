//
//  Pokemon.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Pokemon: Object {
    
    dynamic var id = 0
    dynamic var name = ""
    dynamic var image = ""
    dynamic var weight = ""
    dynamic var height = ""
    dynamic var baseExperience = ""
    dynamic var date = ""
    dynamic var time = ""
    dynamic var order = 0
    var types = List<Type>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func parsePokemon(data: JSON) {
        
        self.id = data["id"].intValue
        
        self.name = data["name"].stringValue
        if let image = data["sprites"].dictionaryValue["front_default"]?.stringValue {
            self.image = image
        }
        self.weight = String(data["weight"].intValue)
        self.height = String(data["height"].intValue)
        self.baseExperience = String(data["base_experience"].intValue)
        self.date = getDate(Date())
        self.time = getTime(Date())
        self.order = data["order"].intValue
        let types: [JSON] = data["types"].arrayValue
        parseTypes(types)
    }
    
    func parseTypes(_ jsonArray: [JSON]) {
        for item in jsonArray {
            let myType = Type()
            myType.parseType(item)
            self.types.append(myType)
        }
    }
    
    func getDate(_ dateTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
        return dateFormatter.string(from: dateTime)
    }
    
    func getTime(_ dateTime: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: dateTime)
    }
    
}
