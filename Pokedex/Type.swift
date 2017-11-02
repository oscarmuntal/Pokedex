//
//  Type.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Type: Object {
    
    dynamic var name = ""
    
    func parseType(_ data: JSON) {
        let type = data["type"].dictionaryValue
        if let name = type["name"]?.stringValue {
            self.name = name
        }
    }
}
