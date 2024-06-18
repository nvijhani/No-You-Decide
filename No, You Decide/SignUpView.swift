//
//  SignUpView.swift
//  No, You Decide
//
//  Created by Nakul Vijhani on 2024-06-12.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                            Text("Sign Up")
                                .font(.system(size: 60, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(color: .purple, radius: 10)
                                .padding(.top, 40)

                VStack(spacing: 15) {
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color(.secondarySystemBackground).opacity(0.7))
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .accentColor(.purple)
                        .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.purple, lineWidth: 1))
                        .shadow(color: .purple, radius: 10)
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color(.secondarySystemBackground).opacity(0.7))
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .accentColor(.purple)
                        .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.purple, lineWidth: 1))
                        .shadow(color: .purple, radius: 10)

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

                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color(.secondarySystemBackground).opacity(0.7))
                        .cornerRadius(5.0)
                        .foregroundColor(.white)
                        .accentColor(.purple)
                        .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.purple, lineWidth: 1))
                        .shadow(color: .purple, radius: 10)
                }

                Button(action: {
                    signUp()
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

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding()
        }
    }

    func signUp() {
        if password != confirmPassword {
            errorMessage = "Passwords do not match!"
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = "Sign Up successful!"
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
