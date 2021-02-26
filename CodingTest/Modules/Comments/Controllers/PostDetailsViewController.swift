//
//  PostDetailsViewController.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//

import UIKit

class PostDetailsViewController: UIViewController {

    @IBOutlet weak var bodyTextView: UITextView!
    
    var viewModel: PostDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard viewModel != nil else {
            fatalError("PostDetailsViewModel not intialized")
        }
        
        updateUI()
    }
    
    func updateUI() {
        title = viewModel.post.name
        bodyTextView.text = viewModel.post.body
    }
}
