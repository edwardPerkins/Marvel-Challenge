//
//  CharacterViewModel.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation

class CharacterListViewModel {
    
    fileprivate weak var dataSource : CharacterListDataSourceDelegate?
    fileprivate var service: CharacterService
    
    fileprivate var pageNo = 0
    
    var selectedCharacter: Character? {
        return dataSource?.currentItem
    }
    
    init(dataSource: CharacterListDataSourceDelegate) {
        self.dataSource = dataSource
        service = CharacterService()
    }
    
    func getCharacters() {
        service.getCharacters(withLimit: NetworkConstant.LIMIT, withPage: pageNo) { result, error  in
            
            guard let response = result else { return }
            switch (response.code) {
                case 200:
                    self.dataSource?.update(data: response.data)
                break
                
                default:
                break
            }
        }
    }
    
    func loadMoreCharacters() {
        pageNo = pageNo + 1
        getCharacters()
    }

}
