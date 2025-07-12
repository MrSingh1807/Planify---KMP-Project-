//
//  SettingScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 06/07/25.
//

import SwiftUI

struct SettingScreen: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("Back Button Pressed")
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(Color(hex: "7E8491"))
                }.padding().buttonStyle(.plain)
                
                Text("Settings")
                    .font(.custom(Caros.bold.font, size: 20))
                Spacer()
            }.padding(.horizontal, 12)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    VStack {
                        Circle()
                            .fill(Color.gray)
                            .overlay(
                                Image(systemName: "arrow.backward")
                                    .tint(Color(hex: "7E8491"))
                            )
                            .frame(width: 64, height: 64)
                            .padding(.top, 24)
                        
                        Text("Mr Singh")
                            .font(.custom(Caros.bold.font, size: 14))
                        
                        Text("example.com")
                            .font(.custom(Caros.medium.font, size: 12))
                            .foregroundColor(Color(hex: "7E8491"))
                        Spacer().frame(height: 12)
                        
                        Button {
                            print("Edit Profile Pressed")
                        } label: {
                            Text("Edit Profile")
                                .font(.custom(Caros.bold.font, size: 14))
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 18)
                        }.padding().background(Color(hex: "00A86B")).cornerRadius(12)
                    }.frame(maxWidth: .infinity)
                    
                    Text("Account")
                        .font(.custom(Caros.medium.font, size: 10))
                        .foregroundColor(Color(hex: "7E8491"))
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    
                    AccountOption(title: Settings.change_password.value, icon: Settings.change_password.icon)
                    AccountOption(title: Settings.go_premium.value, icon: Settings.go_premium.icon, color: Color(hex: "F4AF25"))
                    
                    Text("Prefrences")
                        .font(.custom(Caros.medium.font, size: 10))
                        .foregroundColor(Color(hex: "7E8491"))
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    
                    AccountOption(title: Settings.theme.value, icon: Settings.theme.icon)
                    AccountOption(title: Settings.color_scheme.value, icon:Settings.color_scheme.icon)
                    
                    Divider()
                    
                    Text("More")
                        .font(.custom(Caros.medium.font, size: 10))
                        .foregroundColor(Color(hex: "7E8491"))
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    
                    AccountOption(title: Settings.feedback.value, icon: Settings.feedback.icon)
                    AccountOption(title: Settings.rate_us.value, icon:Settings.rate_us.icon)
                    AccountOption(title: Settings.terms.value, icon:Settings.terms.icon)
                    AccountOption(title: Settings.about_us.value, icon:Settings.about_us.icon)
                    AccountOption(title: Settings.logout.value, icon:Settings.logout.icon,color: Color(hex: "F44725"))
                    
                    Divider().padding(.horizontal, 24)
                    
                    HStack {
                        Text("Version")
                            .font(.custom(Caros.medium.font, size: 12))
                            .foregroundColor(Color(hex: "7E8491"))
                            .padding(.horizontal, 8)
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.custom(Caros.medium.font, size: 12))
                            .foregroundColor(Color(hex: "7E8491"))
                            .padding(.horizontal, 8)
                    }.padding(.vertical, 12)
                        .padding(.horizontal, 24)
                    
                    Divider()
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}


struct AccountOption: View {
    var title: String
    var icon : String
    var color : Color = Color.black
    var onTap: () -> Void = {}
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(icon)
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.custom(Caros.bold.font, size: 14))
                    .foregroundColor(color)
                    .padding(.horizontal, 8)
                
                Spacer()
            }.padding(.vertical, 12)
                .onTapGesture {
                    onTap()
                }
        }.padding(.horizontal, 24)
        
    }
    
}


#Preview {
    SettingScreen()
}
