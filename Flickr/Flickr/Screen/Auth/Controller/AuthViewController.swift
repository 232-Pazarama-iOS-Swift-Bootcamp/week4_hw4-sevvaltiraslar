//
//  AuthViewController.swift
//  Flickr
//
//  Created by SEVVAL on 19.10.2022.
//

import UIKit

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    private let viewModel: AuthViewModel
    
    // MARK: - Init
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Auth"
    }

    @IBAction func signInClicked(_ sender: Any) {
        viewModel.signIn(email: emailText.text!, password: passwordText.text!)
        print("Başarılı")
        let recentViewModel = RecentViewModel()
        let recentViewController = RecentViewController(viewModel: recentViewModel)
        let seacrhViewController = SearchViewController(viewModel: recentViewModel)
        let profileViewController = ProfileViewController(viewModel: recentViewModel)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [recentViewController, seacrhViewController, profileViewController]
        self.navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        viewModel.signUp(email: emailText.text!, password: passwordText.text!)
    }
}
