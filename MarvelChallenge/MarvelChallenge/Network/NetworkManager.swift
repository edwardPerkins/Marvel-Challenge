//
//  NetworkManager.swift
//  MarvelExample
//
//  Created by Edward on 15/07/2021.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

class NetworkManager {
    
    func request<T: Codable>(request: MarvelRequest, onCompletion: @escaping (Result<T>?, Error?) -> ()) {
        
        let requestBuilder = request.build
        
        let ts = String(Date().timeIntervalSince1970)
        var parameters: [String: Any] = [
          "ts" : ts,
          "hash" : MD5.MD5Hex(data: MD5.MD5(string: ts + NetworkConstant.PRIVATE_KEY + NetworkConstant.PUBLIC_KEY)).lowercased(),
          "apikey" : NetworkConstant.PUBLIC_KEY]
        
        parameters.merge(dict: requestBuilder.parameters)
        
        AF.request(requestBuilder.urlString, method: requestBuilder.method, parameters: parameters).responseJSON { response in
            
            switch (response.result) {
                case .success:
                    guard let data = response.data else { return }
                    
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(Result<T>.self, from: data)
                        onCompletion(response, nil)
                    }
                    catch {
                        onCompletion(nil, NetworkError.jsonParsingFailed)
                    }
                break
                
                case .failure:
                    onCompletion(nil, NetworkError.somethingWierd)
            }
        }
    }
    
    func getImage(withUrl: String, onCompletion: @escaping (UIImage?) -> ()) {
        AF.request(withUrl).responseImage { response in
            if case .success(let image) = response.result {
                onCompletion(image)
            }
            else {
                onCompletion(nil)
            }
        }
    }

}
