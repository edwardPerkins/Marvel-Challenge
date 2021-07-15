//
//  Comics.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation

class Comics: Codable {
    
    var available: Int
    var collectionURI: String
    var items: [MarvelItem]?

}
