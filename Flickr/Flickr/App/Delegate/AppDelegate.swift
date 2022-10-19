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
        //let authViewController = AuthViewController(viewModel: AuthViewModel())
        //let authNavigationController = UINavigationController(rootViewController: authViewController)
        //let authViewController = AuthViewController(viewModel: AuthViewModel())
        //let authNavigationController = UINavigationController(rootViewController: authViewController)
        let viewController = RecentViewController(viewModel: RecentViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        let seacrhViewController = SearchViewController(viewModel: RecentViewModel())
        let seacrhNavigationController = UINavigationController(rootViewController: seacrhViewController)
        let profileViewController = ProfileViewController(viewModel: RecentViewModel())
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController, seacrhViewController, profileViewController]
        //window.rootViewController = authViewController
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        FirebaseApp.configure()
        return true
    }


}

