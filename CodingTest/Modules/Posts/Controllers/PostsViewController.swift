//
//  PostsViewController.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = PostsViewModel(networkManager: NetworkManager.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intialSetup()
    }
    
    func intialSetup() {
        tableView.tableFooterView = UIView()
        fetchPosts()
    }
    
    func fetchPosts() {
        showLoader()
        viewModel.getPosts { [weak self] (error) in
            self?.hideLoader()
            guard error == nil else {
                self?.showErrorAlert(error)
                return
            }
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PostDetailsViewController, let indexPath = sender as? IndexPath, let selectedPost = viewModel.posts?[indexPath.row] {
            destination.viewModel = PostDetailsViewModel(post: selectedPost)
        }
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "\(PostTableViewCell.self)") as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        tableViewCell.update(viewModel.posts?[indexPath.row])
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PostDetails", sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
