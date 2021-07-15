//
//  MarvelRequest.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation
import Alamofire

enum MarvelRequest {
    
    case Characters(limit: Int, page: Int)
    
    public var build: (urlString: String, parameters: [String :  Any], method: Alamofire.HTTPMethod) {
        switch self {
        case .Characters(let limit, let page):
            return ( "\(NetworkConstant.BASE_URL)\(MarvelAPIResource.Characters.rawValue)", ["limit": String(limit), "offset": String(page * limit)], .get)
        }
        
    }

}

private enum MarvelAPIResource: String {
    case Characters = "/v1/public/characters"
}
