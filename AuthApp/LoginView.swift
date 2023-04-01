//
//  LoginView.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/29/23.
//

import SwiftUI

private enum FocusableField: Hashable {
  case email
  case password
}

struct LoginView: View {
    @State var email = ""
    @State var password = ""

    @EnvironmentObject var authViewModel: AuthViewModel

    @FocusState private var focus: FocusableField?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color(.secondarySystemBackground))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .focused($focus, equals: .email)
                .submitLabel(.next)
                .onSubmit {
                  self.focus = .password
                }
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.secondarySystemBackground))
                .focused($focus, equals: .password)
                .onSubmit {
                    authViewModel.signIn(email: email, password: password)
                }
            Button {
                if email.isEmpty || password.isEmpty {
                    return
                }
                authViewModel.signIn(email: email, password: password)
            } label: {
                Text("Log In")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.accentColor)
            }
            NavigationLink {
                CreateUserView()
            } label: {
                Text("Create a User")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.accentColor)
            }
        }
        .padding()
        .navigationTitle("Log In")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
