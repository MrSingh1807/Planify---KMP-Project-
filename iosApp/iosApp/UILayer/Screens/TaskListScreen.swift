//
//  TasksScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 29/06/25.
//

import SwiftUI

struct TaskListScreen: View {
    
    let day: Day? = nil
    
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
                
                Text("Tasks")
                    .font(.custom(Caros.bold.font, size: 20))
                Spacer()
            }.padding(.horizontal, 12)
            
            ScrollView {
                VStack(alignment: .leading) {
                    //                    ScrollView {
                    LazyHStack {
                        ForEach(0..<5) { _ in
                            todayTaskCard
                        }
                    }
                    //                    }
                }
            }.padding(.top, 10)
                .background(Color(hex: "F5F7FA"))
            
            
        }.toolbar(.hidden, for: .navigationBar)
    }
    
    
    var todayTaskCard : some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Tasks #234")
                    .font(.custom(Caros.regular.font, size: 12))
                    .foregroundColor(ProjectColor.textGrayColor1.color)
                
                Text("Work Out")
                    .font(.custom(Caros.regular.font, size: 12))
                    .padding(.vertical,8).padding(.horizontal,10)
                    .foregroundColor(Color(hex: "E55C5C"))
                    .background(Color(hex: "FCE8E8").cornerRadius(10))
                    .padding(.leading, 100)
                
            }
            
            Text("Daily Gym Reminder")
                .font(.custom(Caros.bold.font, size: 16))
                .padding(.top, 12)
                .padding(.bottom, 16)
            
            Text(formatTimestamp(1665810600000))
                .font(.custom(Caros.regular.font, size: 10))
                .foregroundColor(ProjectColor.textGrayColor1.color)
        }.padding()
            .background(Color.white.cornerRadius(10))
            .frame(maxWidth: .infinity)
    }
    
    func getDate(_date : Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM, yy"
        return dateFormatter.string(from: _date ?? Date())
    }
    
    func formatTimestamp(_ timestampMillis: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestampMillis) / 1000)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy hh:mm a"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        
        return formatter.string(from: date).uppercased()
    }
    
}

#Preview {
    TaskListScreen()
}
