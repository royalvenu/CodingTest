//
//  PostViewModel.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21.
//

import Foundation

class PostsViewModel {
    
    let networkManager: NetworkManagerProtocol
    var posts: Posts?
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getPosts(_ completion:((ErrorType?) -> Void)? = nil) {
        
        guard Utility.isNetworkReachable else {
            completion?(.noInternet)
            return
        }
        
        NetworkManager.shared.request(type: .get, serviceUrl: .posts, params: nil) { [weak self] (result: Result<Posts>) in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let posts):
                    self?.posts = posts
                    completion?(nil)
                case .failure(let error):
                    completion?(.error(error: error))
                }
            }
        }
    }
}
