//
//  LoginView.swift
//  BareMinimumTracker
//
//  Created by Rohit R. Mohanty on 26/08/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isLoggedIn = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Login").font(.largeTitle).padding()

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Button(action: login) {
                    Text("Login")
                        .padding()
                        .background(isLoggedIn ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(isLoggedIn)
                .padding()

                if isLoggedIn {
                    Text("Login Successful!")
                }
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
        }
    }

    func login() {
        SupabaseManager.shared.signIn(email: email, password: password) { success, error in
            DispatchQueue.main.async {
                if success {
                    isLoggedIn = true
                    errorMessage = nil
                } else {
                    isLoggedIn = false
                    errorMessage = error?.localizedDescription ?? "Invalid credentials. Please try again."
                }
            }
        }
    }
}
