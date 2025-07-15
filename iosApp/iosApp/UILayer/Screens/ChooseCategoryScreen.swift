//
//  ChooseCategoryScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 15/07/25.
//

import SwiftUI

struct ChooseCategoryScreen: View {
    
    @EnvironmentObject private var navStack: NavStack
    
    @State var showAddSheet = false
    
    @State private var selected = Event.hobby
    let options = Event.allCases
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    print("Back Button Pressed")
                    navStack.popBackStack()
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(Color(hex: "7E8491"))
                }.padding().buttonStyle(.plain)
                
                Text("Choose Category")
                    .font(.custom(Caros.bold.font, size: 20))
                
                Spacer()
            }
            
            Divider()
            
            LazyVStack(alignment: .leading) {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option.displayName)
                            .font(.custom(Caros.medium.font, size: 16))
                        Spacer()
                        Image(systemName: selected == option ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(selected == option ? option.color : Color.gray )
                        
                    }.padding(.top, 12)
                        .onTapGesture {
                            selected = option
                        }
                }
                
                
            }.frame(maxHeight: .infinity, alignment: .topLeading)
                .padding()
            
            
            Spacer()
            
            HStack {
                Button {
                    showAddSheet = true
                } label: {
                    Text("Add New Category")
                        .font(.custom(Caros.bold.font, size: 14))
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                    
                }.frame(maxWidth: .infinity)
                    .background(Event.lifestyle.color)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                
                
                Button {
                    navStack.navigate(.create_task)
                } label: {
                    Image(systemName: "chevron.right")
                        .tint(.white)
                }.padding(16)
                    .background(Event.lifestyle.color)
                    .clipShape(Circle())
                    .padding(.trailing,16)
                
                
            }
            
        }.toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented:  $showAddSheet) {
                AddNewCategory()
            }
    }
    
    struct AddNewCategory : View {
        
        @State var title : String = ""
        
        var body: some View {
            
            VStack (alignment: .leading){
                
                Text("Category")
                    .font(.custom(Caros.bold.font, size: 16))
                
                TextField("", text: $title)
                    .font(.custom(Caros.medium.font, size: 14))
                    .padding(8)
                    .padding(.leading, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.top, 8)
                
                Button {
                    
                } label: {
                    Text("Save")
                        .font(.custom(Caros.bold.font, size: 14))
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                    
                }.frame(maxWidth: .infinity)
                    .background(Event.lifestyle.color)
                    .cornerRadius(8)
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                
            }.padding()
        }
    }
    
}

#Preview {
    ChooseCategoryScreen()
}
