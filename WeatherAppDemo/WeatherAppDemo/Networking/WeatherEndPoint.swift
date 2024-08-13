//
//  WeatherEndPoint.swift
//  WeatherAppDemo
//
//  Created by Imaad  on 8/12/24.
//

import Foundation
import SwiftNetworking

enum ProductEndpoint {
    case getWeatherAppData(_ latitude: Double,_ longitude: Double)
}


extension ProductEndpoint: APIConfiguration {
    var baseURLString: String {
        return "https://api.weatherapi.com"
    }

    var urlPath: String {
        let path: String
        switch self {
        case let .getWeatherAppData(latitude, longitude):
            //path =  "/VisualCrossingWebServices/rest/services/timeline/\(latitude),\(longitude)?key=EDEYG4RWBGQGDG99RE2R9DRRC"
            path = "/v1/current.json?q=\(latitude),\(longitude)&lang=en&key=2f176e4ad0b6422496395112241308"
        }
        return baseURLString + path
    }
    
    var parameters: [URLQueryItem] {
        return []
    }
    
    var method: APIMethod {
        let method: APIMethod
        switch self {
        case .getWeatherAppData(_,_):
            method = .get
        }
        return method
    }

    var headers: [String: String]? {

        var keyValPair = [
            "Content-type": "application/json",
            "accept": "application/json",
        ]
        
        switch self {
       /* case let .login:
            keyValPair["Authorization"] = "Bearer \(authToken)"*/
        default:
            break
        }

        return keyValPair
    }

    var body: Encodable? {
        switch self {
       /* case let .login(model):
            return model*/
        default:
            return nil
        }
    }
    
}
