//
//  Data.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation

class Response<T: Codable>: Codable {
    
    var offset: Int = 0
    var limit: Int = 0
    var total: Int = 0
    var count: Int = 0
    var results: [T] = []
    
    func addNew(response: Response<T>) {
        self.offset = response.offset
        self.limit = response.limit
        self.count = response.count
        self.total = response.total
        self.results.append(contentsOf: response.results)
    }

}
