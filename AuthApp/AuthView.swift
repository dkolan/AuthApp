//
//  ContentView.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/29/23.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            if authViewModel.isSignedIn {
                WelcomeView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            authViewModel.isSignedIn = Auth.auth().currentUser != nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
