//
//  StatisticsScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 12/07/25.
//

import SwiftUI

struct StatisticsScreen: View {
    
    let options = ["Weekly", "Monthly", "Yearly", "All"]
    
    @State var selectedState = 0
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("Back Button Pressed")
                } label: {
                    Image(systemName: "arrow.backward")
                        .tint(Color(hex: "7E8491"))
                }.padding().buttonStyle(.plain)
                
                Text("Statistics")
                    .font(.custom(Caros.bold.font, size: 20))
                Spacer()
            }.padding(.horizontal, 8)
            
            Divider()
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        ForEach(0..<options.count, id: \.self) { index in
                            
                            Button {
                                print("Back Button Pressed")
                                selectedState = index
                            } label: {
                                Text( options[index])
                                    .foregroundColor(
                                        selectedState == index ? ProjectColor.selectedTextColor.color :  ProjectColor.unSelectedTextColor.color  )
                                    .font(.custom(Caros.medium.font , size: 12))
                                
                            }.padding(.vertical, 12).frame(maxWidth:.infinity)
                                .background(
                                    selectedState == index ? Color.white : Color.clear
                                ).cornerRadius(10)
                                .buttonStyle(.plain)
                            
                        }
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 4)
                        .background(ProjectColor.background1.color.cornerRadius(10))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                }
                
                HStack {
                    VStack (alignment: .leading){
                        HStack (alignment: .bottom){
                            Text( "428")
                                .foregroundColor(ProjectColor.selectedTextColor.color  )
                                .font(.custom(Caros.bold.font , size: 36))
                            Text( "/496")
                                .foregroundColor(ProjectColor.unSelectedTextColor.color  )
                                .font(.custom(Caros.bold.font , size: 20))
                            Spacer()
                        }
                        
                        Text( "Task Completed")
                            .foregroundColor(ProjectColor.unSelectedTextColor.color  )
                            .font(.custom(Caros.medium.font , size: 14))
                    }.frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading){
                        HStack (alignment: .bottom){
                            Text( "84")
                                .foregroundColor(ProjectColor.selectedTextColor.color  )
                                .font(.custom(Caros.bold.font , size: 36))
                            Text( "%")
                                .foregroundColor(ProjectColor.unSelectedTextColor.color  )
                                .font(.custom(Caros.bold.font , size: 20))
                            Spacer()
                        }
                        
                        Text( "Completion rate")
                            .foregroundColor(ProjectColor.unSelectedTextColor.color  )
                            .font(.custom(Caros.medium.font , size: 14))
                    }.frame(maxWidth: .infinity)
                    
                }.frame(maxWidth: .infinity).padding(16)
                
                ZStack {
                    HStack {
                        ForEach(Event.allCases) { event in
                            Spacer()
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 8]))
                                .foregroundColor(Color(hex: "D4D4D4"))
                                .frame(width: 1)
                        }
                    }.frame(maxWidth: .infinity)
                    
                    VStack {
                        ForEach(Event.allCases) { event in
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(event.secondaryColor)
                                        .frame(
                                            width: geometry.size.width * 0.8, // ✅ 50% of parent width
                                            height: 30
                                        )
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(event.color)
                                        .frame(
                                            width: geometry.size.width * 0.6, // ✅ 50% of parent width
                                            height: 30
                                        )
                                }
                                .frame(width: geometry.size.width * 0.8, height: 30)
                            }
                            .frame(height: 42) // Needed to give GeometryReader a height
                            
                        }
                    }
                    
                }.frame(maxWidth: .infinity)
                    .padding(.horizontal,16)
                
                LazyVStack {
                    ForEach(Event.allCases) { event in
                       
                        
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
                            HStack (alignment: .bottom){
                                Text("96")
                                    .font(.custom(Caros.medium.font, size: 14))
                                Text("/126")
                                    .font(.custom(Caros.medium.font,size: 10))
                                    .padding(.bottom, 1)
                            }
                            Spacer()
                            
                            Text(event.rawValue)
                                .font(.custom(Caros.medium.font, size: 11))
                                .foregroundColor(Color(hex: "7E8491"))
                            
                           
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                        
                        Divider()
                    }
                }.padding(16)
                
                
              
            
                
            }.frame(maxWidth: .infinity,alignment: .topLeading)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    StatisticsScreen()
}
