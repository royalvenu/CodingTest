//
//  Protocols.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//  Copyright © 2020 Venu . All rights reserved.
//

import Foundation
import MKProgress

protocol Loader { }

fileprivate var spinnerCounter = 0

extension Loader {
    
    func showLoader(enableCounter: Bool = true) {
        if enableCounter {
            spinnerCounter += 1
        }
        DispatchQueue.main.async {
            MKProgress.show()
        }
    }
    
    func hideLoader(forceHide: Bool = false) {
        spinnerCounter -= 1
        spinnerCounter = forceHide ? 0 : spinnerCounter
        if spinnerCounter <= 0 {
            DispatchQueue.main.async {
                MKProgress.hide()
            }
            spinnerCounter = 0
        }
    }
}

extension UIViewController: Loader { }
