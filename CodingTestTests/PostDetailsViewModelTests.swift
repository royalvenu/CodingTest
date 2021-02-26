//
//  PostDetailsViewModelTests.swift
//  CodingTestTests
//
//  Created by Venu Gopal on 25/02/21.
//

import XCTest
@testable import CodingTest

class PostDetailViewModelTests: XCTestCase {
    
    var viewModel: PostDetailsViewModel?
  
    override func setUp() {
        super.setUp()
        
        viewModel = PostDetailsViewModel(post: PostModel(postID: 2, id: 2, name: "new post", email: "post@post.com", body: "comment body"))
    }
    
    func testPost() {
        XCTAssertNotNil(viewModel?.post.postID)
    }
    
    func testPostId() {
        XCTAssertNotNil(viewModel?.post.id)
    }

    func testPostName() {
        XCTAssertNotNil(viewModel?.post.name)
    }

    func testPostEmail() {
        XCTAssertNotNil(viewModel?.post.email)
    }
}
