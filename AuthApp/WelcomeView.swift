//
//  WelcomeView.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/30/23.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var authViewModel = AuthViewModel()

    @State private var animationAmount: CGFloat = 1

    var body: some View {
        VStack {
            Link("Welcome :)", destination: URL(string:"https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.accentColor)
                .scaleEffect(animationAmount)
                .animation(
                    .linear(duration: 0.3)
                        .delay(0.3)
                        .repeatForever(autoreverses: true),
                    value: animationAmount)
                .onAppear {
                    animationAmount = 1.1
                }
                .padding()
            Button(action: {
                authViewModel.signOut()
            }, label: {
                Text("Sign Out")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.accentColor)
                    .padding()
            })
        }
    }
}

extension Animation {
    func reverse(on: Binding<Bool>, delay: Double) -> Self {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            on.wrappedValue = false /// Switch off after `delay` time
        }
        return self
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
