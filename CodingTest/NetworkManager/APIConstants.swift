//
//  APIConstants.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21.
//

import Foundation

enum APIConstants: String {
    
    static var baseUrl: String = "https://jsonplaceholder.typicode.com/"

    case posts = "posts/1/comments"
}

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
}

enum Result<T> {
    case success(T)
    case failure(Error?)
}

