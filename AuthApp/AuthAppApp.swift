//
//  AuthAppApp.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/29/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct AuthAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        let authViewModel = AuthViewModel()
        WindowGroup {
            AuthView()
                .environmentObject(authViewModel)
        }
    }
}
