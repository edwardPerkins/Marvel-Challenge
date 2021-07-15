//
//  UIImageView+Ext.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    func setImage(withUrl: String) {
        if let url = URL(string: withUrl) {
            self.af.setImage(withURL: url)
        }
    }
    
}
