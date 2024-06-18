//
//  LoginView.swift
//  No, You Decide
//
//  Created by Nakul Vijhani on 2024-06-12.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isForgotPasswordPresented = false

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Login")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 10)
                    .padding(.top, 40)
                
                VStack(spacing: 15) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground).opacity(0.7))
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .accentColor(.purple)
                        .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.purple, lineWidth: 1))
                        .shadow(color: .purple, radius: 10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground).opacity(0.7))
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .accentColor(.purple)
                        .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.purple, lineWidth: 1))
                        .shadow(color: .purple, radius: 10)
                }

                Button(action: {
                    login()
                }) {
                    Text("Proceed")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                                                  startPoint: .leading,
                                                  endPoint: .trailing))
                        .cornerRadius(15.0)
                        .shadow(color: .purple, radius: 10)
                }
                
                Button(action: {
                    isForgotPasswordPresented.toggle()
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isForgotPasswordPresented) {
                    ForgotPasswordView()
                }
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding()
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = "Login successful!"
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
