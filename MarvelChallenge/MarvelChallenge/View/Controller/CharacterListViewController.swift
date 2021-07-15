//
//  ViewController.swift
//  iOS Challenge
//
//  Created by Edward on 15/07/2021.
//

import UIKit

protocol CharactersView {
    func getMoreCharacters()
    func notifyDataUpdate()
    func showDetail(character: Character)
}

class CharacterListViewController: UITableViewController {
    
    let dataSource = CharacterListDataSourceDelegate()
        
    lazy var viewModel : CharacterListViewModel = {
        dataSource.view = self
        let viewModel = CharacterListViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: CharacterTableViewCell.NIB, bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.REUSE_IDENTIFIER)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        
        self.viewModel.getCharacters()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? CharacterDetailViewController else { return }
        
        controller.viewModel = CharacterViewModel(character: viewModel.selectedCharacter)
    }
    
}

extension CharacterListViewController: CharactersView {
    
    func notifyDataUpdate() {
        self.tableView.reloadData()
    }
    
    func getMoreCharacters() {
        self.viewModel.loadMoreCharacters()
    }
    
    func showDetail(character: Character) {
        self.performSegue(withIdentifier: AppSegues.GoToCharacterDetail.value, sender: self)
    }
}



