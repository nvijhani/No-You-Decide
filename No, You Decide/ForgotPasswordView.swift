//
//  ForgotPasswordView.swift
//  No, You Decide
//
//  Created by Nakul Vijhani on 2024-06-12.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var message = ""

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Forgot Password")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .purple, radius: 10)
                    .padding(.top, 40)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground).opacity(0.7))
                    .cornerRadius(5.0)
                    .foregroundColor(.white)
                    .accentColor(.purple)
                    .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.purple, lineWidth: 1))
                    .shadow(color: .purple, radius: 10)
                
                Button(action: {
                    sendPasswordReset()
                }) {
                    Text("Send Reset Email")
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
                
                if !message.isEmpty {
                    Text(message)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding()
        }
    }

    func sendPasswordReset() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                message = error.localizedDescription
            } else {
                message = "Password reset email sent!"
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
