//
//  APIError.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import SwiftyJSON

let error_Acces_Token_Code = 403
let error_Acces_Token_Key = "forbidden-access"

class APIError: Error {
    
    var statusCode:Int?
    var message:String?
    var errorKey:String?
    var stacktrace:String?
    
    init(errorData: JSON?) {
        
        if let errorData = errorData {
            
            statusCode = errorData["statusCode"].int
            errorKey = errorData["errorKey"].string
            message = errorData["message"].string
            stacktrace = errorData["stacktrace"].string
            
        }
    }
}

