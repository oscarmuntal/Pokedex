//
//  ApiManager.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiManager: NSObject {
    
    static let sharedInstance = ApiManager()
    var apiManager: SessionManager?
    let session = URLSession.shared
    
    override init() {
        super.init()
        apiManager = SessionManager.default
    }
    
    //MARK: - Request Methods
    func get(path: String, parameters: Dictionary<String, AnyObject>? = nil, successBlock: @escaping RequestSuccessBlock, errorBlock:@escaping RequestErrorBlock) {
        
        let url = API_URL + path
        apiManager?.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: [:]).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successBlock(json)
            case .failure(_):
                break
            }
        })
    }
}
