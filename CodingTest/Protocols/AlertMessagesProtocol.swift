//
//  AlertMessagesProtocol.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//

import UIKit

protocol AlertMessagesProtocol { }

extension AlertMessagesProtocol where Self: UIViewController {
    
    func showAlertwithTitle(title: String = "MFF", message: String, actions: [UIAlertAction]? = nil) {
        let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        if let actions = actions {
            actions.forEach { (action) in
                alerController.addAction(action)
            }
        } else {
            alerController.addAction(cancelAction)
        }
        present(alerController, animated: true, completion: nil)
    }
    
    func showWarningAlert(message: String, openSettings: Bool = false){
        self.showAlertwithTitle(title: "Warning..!", message: message)
    }
    
    func showNoNetwork(message: String = ErrorMessages.networkConnection.rawValue){
        self.showAlertwithTitle(title: "Warning..!", message: message)
    }
    
    func showError(_ error: Error?) {
        showAlertwithTitle(title: "Error", message: error?.localizedDescription ?? ErrorMessages.errorMessage.rawValue)
    }
}

extension UIViewController: AlertMessagesProtocol { }
