//
//  ErrorMessagesProtocol.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//

import UIKit

protocol ErrorMessagesProtocol: AlertMessagesProtocol { }

extension ErrorMessagesProtocol where Self: UIViewController {
    
    func showErrorAlert(_ errorType: ErrorType?) {
        switch errorType {
        case .noInternet:
            showNoNetwork()
        case .error(let error):
            showError(error)
        case .none:
            showWarningAlert(message: ErrorMessages.errorMessage.rawValue)
        }
    }
}

extension UIViewController: ErrorMessagesProtocol { }
