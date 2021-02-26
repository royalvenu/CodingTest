//
//  NetworkManagerProtocol.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    
    static var shared: NetworkManagerProtocol { get set }
    
    func request<T: Decodable>(type: HTTPMethod, serviceUrl: APIConstants, params: [String: Any]?, completion: @escaping ((_ result: Result<T>) -> Void))
}
