//
//  MockNetworkManager.swift
//  CodingTestTests
//
//  Created by Venu Gopal on 25/02/21.
//

@testable import CodingTest
import Foundation

class MockNetworkManager: NetworkManagerProtocol {

    var jsonName: String = ""
    
    static var shared: NetworkManagerProtocol = MockNetworkManager()

    func request<T>(type: HTTPMethod, serviceUrl: APIConstants, params: [String : Any]?, completion: @escaping ((Result<T>) -> Void)) where T : Decodable {
        
        let testBundle = Bundle(for: Swift.type(of: self))
        if let url = testBundle.url(forResource: jsonName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let posts = try decoder.decode(T.self, from: data)
                completion(.success(posts))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
}
