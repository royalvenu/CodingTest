//
//  PostModel.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//

import Foundation

// MARK: - Post
struct PostModel: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Posts = [PostModel]
