//
//  AddTaskScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 12/07/25.
//

import SwiftUI

struct AddTaskScreen: View {
    

    @EnvironmentObject private var navStack: NavStack
    
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    print("Back Button Pressed")
                    navStack.popBackStack()
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(Color(hex: "7E8491"))
                }.padding().buttonStyle(.plain)
                
                Text("Add New Task")
                    .font(.custom(Caros.bold.font, size: 20))
                
                Spacer()
                
            }.padding(.horizontal, 12)
        
            ScrollView {
                VStack(alignment: .leading) {
                    Divider()


                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "F5F7FA"))
            
            
            Button {
                print("Back Button Pressed")
                navStack.popBackStack()
            } label: {
                Text("Save")
                    .font(.custom(Caros.bold.font, size: 14))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Event.lifestyle.color.cornerRadius(8))
                   
            }.frame(maxWidth: .infinity)
            
        }.toolbar(.hidden, for: .navigationBar)
        
    }
}

#Preview {
    AddTaskScreen()
}
