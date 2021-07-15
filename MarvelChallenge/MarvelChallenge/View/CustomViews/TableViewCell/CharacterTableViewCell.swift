//
//  SeriesTableViewCell.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static var NIB: String {
        return "CharacterTableViewCell"
    }
    
    static var REUSE_IDENTIFIER: String {
        return "CharacterCell"
    }
    
    @IBOutlet weak var imgCharacterThumbnail: UIImageView!
    @IBOutlet weak var lblCharacterTitle: UILabel!
    @IBOutlet weak var lblCharacterDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
