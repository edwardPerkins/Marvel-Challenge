//
//  CharacterDetailViewController.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var viewModel : CharacterViewModel?
    
    @IBOutlet weak var imgCharacterThumbnail: UIImageView!
    @IBOutlet weak var lblCharacterID: UILabel!
    @IBOutlet weak var lblCharacterTitle: UILabel!
    @IBOutlet weak var lblCharacterComics: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Setup UI
    fileprivate func setupView() {
        guard let viewModel = viewModel else { return }
        self.lblCharacterID.text = viewModel.getID()
        self.lblCharacterTitle.text = viewModel.getName()
        self.lblCharacterComics.text = viewModel.getComics()
        
        viewModel.getCharacterImage { image in
            if let img = image {
                self.imgCharacterThumbnail.image = img
            }
        }
    }

}
