//
//  AppDelegate.swift
//  Example_RemoteConfig
//
//  Created by 이희웅 on 2023/06/30.
//

import UIKit
import FirebaseCore
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        Installations.installations().authTokenForcingRefresh(true, completion: { (result, error) in
            if let error = error {
                print("Error fetching token: \(error)")
                return
            }
            guard let result = result else { return }
            print("Installation auth token: \(result.authToken)")
        })
        
        return true
    }
}

