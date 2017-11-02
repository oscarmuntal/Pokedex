//
//  Typealiases.swift
//  Pokedex
//
//  Created by Òscar Muntal on 02/11/2017.
//  Copyright © 2017 Òscar Muntal. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias VoidClosure = () -> (Void)
typealias ObjectClosure<T> = (_: T) -> (Void)
typealias RequestSuccessBlock = (_ response: JSON?) -> Void
typealias RequestSuccessObject = (AnyObject) ->  Void
typealias RequestErrorBlock = (_ error: APIError?) -> Void
