//
//  Image.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import UIKit

class Image: Codable {

  var path: String?
  var ext: String?

  var url: String {
    guard let p = path, let e = ext else { return "" }
    return p + "." + e
  }

  enum CodingKeys: String, CodingKey {
    case path
    case ext = "extension"
  }
}
