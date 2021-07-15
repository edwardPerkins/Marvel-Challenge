//
//  Character.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation

class Character: Codable {
    
    var id: Int
    var name: String
    var description: String
    var thumbnail: Image
    var resourceURI: String
    var comics: Comics

}
