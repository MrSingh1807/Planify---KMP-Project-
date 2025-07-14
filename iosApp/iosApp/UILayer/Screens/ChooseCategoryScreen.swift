//
//  ChooseCategoryScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 15/07/25.
//

import SwiftUI

struct ChooseCategoryScreen: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    print("Back Button Pressed")
//                    navStack.popBackStack()
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(Color(hex: "7E8491"))
                }.padding().buttonStyle(.plain)
                
                Text("Choose Category")
                    .font(.custom(Caros.bold.font, size: 20))
                
                Spacer()
                
            }.padding(.horizontal, 12)
            
            Divider()
            
            LazyVStack {
                
                
                
            }.frame(maxHeight: .infinity)
        }.toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    ChooseCategoryScreen()
}
