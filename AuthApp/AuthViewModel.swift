//
//  AuthViewModel.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/29/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()

    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard authResult != nil, error == nil else {
                return
            }
        }
    }

    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard authResult != nil, error == nil else {
                return
            }
        }
    }

    func signOut() {
        try? auth.signOut()
    }
}
