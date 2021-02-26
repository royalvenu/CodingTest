//
//  AppSharedData.swift
//  CodingTest
//
//  Created by Venu Gopal on 25/02/21
//  Copyright © 2020 Venu. All rights reserved.
//

import UIKit
import Reachability
import MKProgress

class Utility {
    
    static var isNetworkReachable = true
    
    static func intializeSetUp() {
        
        let reachability = try! Reachability()
        reachability.whenReachable = { _ in isNetworkReachable = true }
        reachability.whenUnreachable = { _ in isNetworkReachable = false }
        try? reachability.startNotifier()
        
        MKProgress.config.circleRadius = 37
        MKProgress.config.circleBorderWidth = 3.0
        MKProgress.config.circleBorderColor = UIColor.black
        MKProgress.config.circleAnimationDuration = 0.9
        MKProgress.config.circleArcPercentage = 0.85
        MKProgress.config.preferredStatusBarStyle = .lightContent
    }
    
    static func setupNavigationBar() {
        
        if #available(iOS 13.0, *){
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .purple
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().prefersLargeTitles = true
            appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().barTintColor = .purple
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().prefersLargeTitles = true
        }
    }
}

enum ErrorType {
    case noInternet
    case error(error: Error?)
}
