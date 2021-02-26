//
//  CodingTestTests.swift
//  CodingTestTests
//
//  Created by Venu Gopal on 25/02/21.
//

import XCTest
@testable import CodingTest

class PostsViewModelTests: XCTestCase {
    
    var viewModel: PostsViewModel?
  
    override func setUp() {
        super.setUp()
        
        viewModel = PostsViewModel(networkManager: MockNetworkManager.shared)
    }
    
    func testGetPosts() {
        (viewModel?.networkManager as? MockNetworkManager)?.jsonName = "MockPosts"
        viewModel?.getPosts { [weak self] (error) in
            guard error != nil else {
                return
            }
            XCTAssertNotNil(self?.viewModel?.posts)
        }
    }
    
    func testGetPostsFail() {
        (viewModel?.networkManager as? MockNetworkManager)?.jsonName = "MockPosts_data"
        viewModel?.getPosts { [weak self] (error) in
            guard error != nil else {
                return
            }
            XCTAssertNil(self?.viewModel?.posts)
        }
    }
}
