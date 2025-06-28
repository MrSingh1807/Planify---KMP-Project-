//
//  OnboardScreen.swift
//  ToDo
//
//  Created by Mayank Singh on 25/05/25.
//

import Foundation
import SwiftUI
import Shared

struct OnboardScreen: View {
    
  //  private let sharedPref = SharedPreference()

    
    @State var willMoveToSignUpScreen = false
    @State var willMoveToLogInScreen = false
    
    
    var body : some View {
    
        ZStack {
            ScrollView {
                VStack{
                    HStack {
                        Image("ic_logo")
                            .resizable()
                            .frame(width: 18, height: 18)
                        
                        Text("Easy Note")
                            .font(.custom("Caros", size: 14))
                            .foregroundColor(Color.white)
                    }.padding(.top, 80)
                    
                    Text("Manage Notes \neasily & quickly")
                        .font(.custom("Caros Bold", size : 70))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .lineSpacing(10)
                    
                    Text("Our notes app is the perfect way to manage daily tasks, ideas and more.")
                        .font(.custom("Caros Bold", size : 16))
                        .foregroundColor(Color(hex: "B9C1BE"))
                        .lineSpacing(4)
                        .padding(.top, 16)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            print("Facebook tapped!")
                        }) {
                            Image("fb_logo")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                )
                            
                        }
                        Button(action: {
                            print("Google tapped!")
                        }) {
                            Image("google_logo")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        Button(action: {
                            print("Apple tapped!")
                        }) {
                            Image("apple_logo")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 24, height: 28)
                                .padding()
                                .foregroundColor(.white) // Tint color
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                        
                    }.frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 30)
                    
                    
                    HStack {
                        VStack{    Divider()
                                .background(Color(hex: "CDD1D0"))
                            .frame(height: 1)}
                        
                        
                        Text("OR")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        VStack{ Divider()
                                .background(Color(hex: "CDD1D0"))
                            .frame(height: 1)}
                    }.frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical, 30)
                    
                    
                    Button("Sign up with mail") {
                        willMoveToSignUpScreen = true
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color(hex: "F3F6F6"))
                        .cornerRadius(16)
                        .font(.custom("Caros Bold", size: 16))
                        .foregroundColor(Color(hex:"000E08"))
                        .padding(.bottom, 46)
                    
                    HStack {
                        Text("Existing account?")
                            .foregroundColor(Color(hex: "B9C1BE"))
                            .padding(.trailing, 2)
                        
                        Button("Log in"){
                            willMoveToLogInScreen = true
                        }.foregroundColor(.white)
                            .font(.custom("Caros Bold", size: 16))
                            
                    }.padding(.bottom, 40)
                }
                .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .leading)
                .padding(.horizontal, 16)
                
            }
            
        }.ignoresSafeArea()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "43116A"),Color(hex: "0A1832")]),
                    startPoint: .top,
                    endPoint: .leading
                )
            )
//            .navigate(to: SignUpScreen(), when: $willMoveToSignUpScreen)
//            .navigate(to: LoginScreen(), when: $willMoveToLogInScreen)
    }
    
}

#Preview {
    HomeScreen()
}
