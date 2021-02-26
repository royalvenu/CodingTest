//
//  APIManager.swift
//  TickTech
//
//  Created by Venu Gopal on 25/02/21.
//  Copyright © 2019 Other. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager: NetworkManagerProtocol {
    
    private init() { }
    
    static var shared: NetworkManagerProtocol = NetworkManager()
    
    func request<T : Decodable>(type: HTTPMethod, serviceUrl: APIConstants, params: [String : Any]?, completion: @escaping ((Result<T>) -> Void)) {
        
        let api = APIConstants.baseUrl + "\(serviceUrl.rawValue)"
        
        guard let validURL = URL(string: api) else { return }
        
        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = type.rawValue
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.timeoutInterval = 5*60*60
        
        if type == .post, let parameters = params {
            do {
                let data = try JSONSerialization.data(withJSONObject: parameters as Any, options: [])
                urlRequest.httpBody = data
            }catch{
                print("unable to type convert parms to json")
            }
        }
        
        let configuration = URLSessionConfiguration.default
        URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
            .dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(error))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch let error {
                    completion(.failure(error))
                }
            }).resume()
    }
}
