//
//  CreateUserView.swift
//  AuthApp
//
//  Created by Dan Kolan on 3/30/23.
//

import SwiftUI

private enum FocusableField: Hashable {
  case email
  case password
}

struct CreateUserView: View {
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
                authViewModel.signUp(email: email, password: password)
            } label: {
                Text("Create User")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.accentColor)
            }
        }
        .padding()
        .navigationTitle("Create an Account")
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
