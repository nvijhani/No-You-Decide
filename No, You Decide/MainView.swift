//
//  MainView.swift
//  No, You Decide
//
//  Created by Nakul Vijhani on 2024-06-12.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State private var animateGradient = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background with animated gradient and shapes
                RadialGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.black]),
                               center: .center, startRadius: 2, endRadius: 650)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.8)
                    .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateGradient)
                    .onAppear {
                        self.animateGradient.toggle()
                    }
                
                // Add some rotating shapes
                GeometryReader { geometry in
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 200, height: 200)
                        .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.2)
                        .blur(radius: 20)
                        .opacity(0.5)
                        .rotationEffect(.degrees(animateGradient ? 360 : 0))
                        .animation(.linear(duration: 15).repeatForever(autoreverses: false), value: animateGradient)
                    
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 150, height: 150)
                        .position(x: geometry.size.width * 0.8, y: geometry.size.height * 0.8)
                        .blur(radius: 30)
                        .opacity(0.4)
                        .rotationEffect(.degrees(animateGradient ? -360 : 0))
                        .animation(.linear(duration: 20).repeatForever(autoreverses: false), value: animateGradient)
                }

                VStack(spacing: 40) {
                    Spacer()
                    
                    Text("No, You Decide")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(Color.white)
                        .shadow(color: .purple, radius: 10)
                        .scaleEffect(1.1)
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: 1.1)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.purple)
                                .cornerRadius(15.0)
                                .shadow(color: .purple, radius: 10)
                                .scaleEffect(1.1)
                                .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: 1.1)
                        }
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220, height: 60)
                                .background(Color.purple)
                                .cornerRadius(15.0)
                                .shadow(color: .purple, radius: 10)
                                .scaleEffect(1.1)
                                .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: 1.1)
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
