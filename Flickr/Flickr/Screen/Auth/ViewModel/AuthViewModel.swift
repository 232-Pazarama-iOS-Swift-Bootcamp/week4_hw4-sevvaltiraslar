//
//  AuthViewModel.swift
//  Flickr
//
//  Created by SEVVAL on 18.10.2022.
//

import Foundation
import UIKit
import Firebase

enum AuthViewModelChange {
    case didErrorOccurred(_ error: Error)
    case didSignUpSuccessful
}

class AuthViewModel {
    
    var changeHandler: ((AuthViewModelChange) -> Void)?
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authdata, error in
            if let error = error {
                self.changeHandler?(.didErrorOccurred(error))
                return
            }
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authdata, error in
            if let error = error {
                self.changeHandler?(.didErrorOccurred(error))
                return
            }
            
        }
    }
}
