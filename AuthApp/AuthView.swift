//
//  ContentView.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/29/23.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
