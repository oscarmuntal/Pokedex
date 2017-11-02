//
//  String+BWExtension.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

let API_URL = "http://pokeapi.co/api"

let API_VERSION_V1 = "/v1"
let API_VERSION_V2 = "/v2"
let API_VERSION_V3 = "/v3"

enum kAPI_ENDPOINT: String {
    case kAPI_ENDPOINT_GET_POKEMON = "API_ENDPOINT_GET_POKEMON"
    case kAPI_ENDPOINT_GET_TYPE = "API_ENDPOINT_GET_TYPE"
    case kAPI_ENDPOINT_GET_ABILITY = "API_ENDPOINT_GET_ABILITY"
}

extension String {
    
    func getApiEndpointPath(type: kAPI_ENDPOINT) -> String {
        var path = ""
        switch type {
        case .kAPI_ENDPOINT_GET_POKEMON:
            path =  API_VERSION_V2 + "/pokemon/"
            break
        case .kAPI_ENDPOINT_GET_TYPE:
            path =  API_VERSION_V2 + "/type/"
            break
        case .kAPI_ENDPOINT_GET_ABILITY:
            path =  API_VERSION_V2 + "/ability/"
            break
        }
        return path
    }
    
}
