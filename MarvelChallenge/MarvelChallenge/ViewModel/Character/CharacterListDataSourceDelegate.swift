//
//  CharacterDataSourceDelegate.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import UIKit
import Foundation
import AlamofireImage

class CharacterListDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var data: Response<Character>?
    var view: CharactersView?
    
    var currentItem: Character?
    
    func update(data: Response<Character>) {
        if (self.data == nil) {
            self.data = data
        }
        else {
            self.data?.addNew(response: data)
        }
        view?.notifyDataUpdate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let total = data?.total ?? 0
        let offset = data?.offset ?? 0
        let current = data?.count ?? 0
        
        if offset == 0, current == 0 { return 1 }
        else if offset+current < total { return offset + current + 1 }
        else if offset+current == total { return offset + current }
        else { return 1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let offset = data?.offset ?? 0
        let current = data?.count ?? 0
        
        if current == 0 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "NoDataCell")
            cell.textLabel?.text = "No Data"
            return cell
            
        }
        
        else if indexPath.row < offset+current {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.REUSE_IDENTIFIER) as? CharacterTableViewCell else {
                return UITableViewCell()
            }
            
            if let character = data?.results[indexPath.row] {
                cell.lblCharacterTitle.text = character.name
                cell.lblCharacterDesc.text = character.description
                cell.imgCharacterThumbnail.setImage(withUrl: character.thumbnail.url)
            }
            
            return cell
        }
        else if indexPath.row == offset+current {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "LoadMore")
            cell.textLabel?.text = "Load More.."
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let offset = data?.offset ?? 0
        let current = data?.count ?? 0
        
        if indexPath.row < offset+current {
            if let character = data?.results[indexPath.row] {
                self.currentItem = character
                view?.showDetail(character: character)
            }
        }
        
        else if indexPath.row == offset+current {
            view?.getMoreCharacters()
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CharacterTableViewCell else {
            return
        }
        cell.imgCharacterThumbnail.image = nil
        if let character = data?.results[indexPath.row] {
            cell.lblCharacterTitle.text = character.name
            cell.lblCharacterDesc.text = character.description
            cell.imgCharacterThumbnail.setImage(withUrl: character.thumbnail.url)
        }
    }
}
