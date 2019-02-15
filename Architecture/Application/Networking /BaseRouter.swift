//
//  BaseRouter.swift
//  Architecture
//
//  Created by Jacob Wagstaff on 2/14/19.
//  Copyright © 2019 Jacob Wagstaff. All rights reserved.
//

import Foundation
//import Alamofire
//import KeychainAccess
//import SwiftyJSON

public typealias JSONDictionary = [String: AnyObject]
typealias RequestHeader = [String : String]?

/// Routers must conform to this protocol otherwise the APIManager won't allow their use.
protocol APIConfigured {
//    var method: HTTPMethod { get }
//    var path: String { get }
//    var headers: HTTPHeaders { get }
//    var parameters: Parameters { get }
//    var baseUrl: String { get }
//    var encoding: ParameterEncoding { get }
}

/**
 The BaseRouter is the superclass of our network routers.
 It should never be used directly, only inherited from.
 Any subclasses should override the APIConfigured Protocol elements.
 */
class BaseRouter: APIConfigured {
    
    // MARK : Properties
//    let keychain = Keychain(service: Constants.Keys.service)
//
//    let useError = "Override BaseRouter with a subclass."
//    var token = ""
//
//    // MARK: Initializers
//    init() {
//        if let authorization = keychain[Constants.Keys.authToken]{
//            token = authorization
//        }
//    }
//
//    var method: HTTPMethod {
//        fatalError(useError)
//    }
//
//    var path: String {
//        fatalError(useError)
//    }
//
//    var headers: HTTPHeaders {
//        fatalError(useError)
//    }
//
//    var parameters: Parameters {
//        fatalError(useError)
//    }
//
//    var baseUrl: String {
//        return ""
//    }
//
//    /// headers that all requests include
//    var baseHeaders: HTTPHeaders {
//        return [ "Accept": "application/json" ]
//    }
//
//    var authorizedHeaders: HTTPHeaders {
//        return [ "Authorization": "\(token)" ]
//    }
//
//    /// A string combining the baseUrl and the request's specific path
//    var fullPath: String {
//        return "\(baseUrl)\(path)"
//    }
//
//    /// A dictionary containing both the baseHeaders and the request's specific headers.
//    var fullHeaders: HTTPHeaders {
//        var combined = baseHeaders
//        for (key, value) in headers {
//            combined[key] = value
//        }
//        return combined
//    }
//
//    var encoding: ParameterEncoding {
//        fatalError(useError)
//    }
}
