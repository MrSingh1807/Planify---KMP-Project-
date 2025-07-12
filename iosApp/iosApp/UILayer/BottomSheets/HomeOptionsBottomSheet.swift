//
//  HomeOptionsBottomSheet.swift
//  iosApp
//
//  Created by Mayank Singh on 06/07/25.
//

import SwiftUI

struct HomeOptionsBottomSheet: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(HomeSection.allCases) { section in
                Button(action: {
                    print("\(section) tapped")// Perform action here
                }) {
                    HStack {
                        Image(section.icon)
                            .font(.title3)
                        Text(section.displayName)
                            .font(.custom(Caros.medium.font, size: 14))
                            .padding(.leading, 8)
                    }.frame(width: .infinity, alignment: .leading)
                }.padding(8).buttonStyle(.plain)
                
                Divider()
            }
            
            Text("Lists")
                .font(.custom(Caros.regular.font, size: 14))
                .foregroundColor(Color(hex: "7E8491"))
                .padding(.vertical, 8)
            
            LazyVStack {
                ForEach(Event.allCases) { event in
                    Divider()
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(event.color, lineWidth: 1)
                            ).frame(width: 16, height: 16)
                        
                        Text(event.displayName)
                            .font(.custom(Caros.medium.font, size: 14))
                        
                        Spacer()
                        
                        Text(event.rawValue)
                            .font(.custom(Caros.medium.font, size: 11))
                            .foregroundColor(Color(hex: "7E8491"))
                                  
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                }
            }
            
            Divider()
            
            Button(action: {
                print("New List tapped")// Perform action here
            }) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title3)
                        .tint(Event.lifestyle.color)
                        .frame(width: 16, height: 16)
                    
                    Text("New list")
                        .font(.custom(Caros.medium.font, size: 14))
                        .padding(.leading, 8)
                        .foregroundColor(Event.lifestyle.color)
                }.frame(width: .infinity, alignment: .leading)
            }.padding(8).buttonStyle(.plain)
            
            
        }.frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(20)
        
        
    }
}

#Preview {
    HomeOptionsBottomSheet()
}
