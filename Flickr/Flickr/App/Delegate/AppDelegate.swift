//
//  AppDelegate.swift
//  Flickr
//
//  Created by SEVVAL on 12.10.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    private func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = RecentViewController(viewModel: RecentViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        FirebaseApp.configure()
        return true
    }


}

