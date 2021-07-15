//
//  CharacterService.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation
import UIKit

protocol CharacterServiceProtocol {
    
    func getCharacters(withLimit: Int, withPage: Int, onCompletion: @escaping ((Result<Character>?, Error?) -> Void))
}

final class CharacterService: CharacterServiceProtocol {
    
    fileprivate let manager = NetworkManager()
    
    
    func getCharacters(withLimit: Int, withPage: Int, onCompletion: @escaping ((Result<Character>?, Error?) -> Void)) {
        
        manager.request(request: .Characters(limit: withLimit, page: withPage)) { (result: Result<Character>?, error: Error?) in
            onCompletion(result, error)
            
        }
    }
    
    func getImage(withUrl: String, onCompletion: @escaping (UIImage?) -> ()) {
        manager.getImage(withUrl: withUrl, onCompletion: onCompletion)
    }
}
