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
    @Published var isSignedIn = false

    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard authResult != nil, error == nil else {
                return
            }
            self?.isSignedIn = true
            print("\(authResult?.user.email) logged in")
        }
    }

    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard authResult != nil, error == nil else {
                return
            }
            self?.isSignedIn = true
            print("\(authResult?.user.email) logged in")
        }
    }

    func signOut() {
        try? auth.signOut()
    }
}
