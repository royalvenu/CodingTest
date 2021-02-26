//
//  PostTableViewCell.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodylabel: UILabel!
    
    func update(_ model: PostModel?) {
        nameLabel.text = model?.name
        emailLabel.text = model?.email
        bodylabel.text = model?.body
    }
}
