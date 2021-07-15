//
//  CharacterViewModel.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation
import UIKit

class CharacterViewModel {
    
    fileprivate weak var character: Character?
    fileprivate var service: CharacterService
    
    init(character: Character?) {
        self.character = character
        service = CharacterService()
    }
    
    func getCharacterImage(onCompletion: @escaping (UIImage?) -> ()) {
        guard let urlString = character?.thumbnail.url else { return }
        service.getImage(withUrl: urlString) { image in
            onCompletion(image)
        }
    }
    
    func getID() -> String {
        guard let id = character?.id else {
            return "No ID available"
        }
        return "ID: \(id)"
    }
    
    func getName() -> String {
        guard let name = character?.name else {
            return "No Name available"
        }
        return name
    }
    
    func getComics() -> String {
        guard let available = character?.comics.available else {
            return "No ID available"
        }
        return "Comics: \(available)"
    }
}
