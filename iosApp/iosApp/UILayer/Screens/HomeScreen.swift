//
//  HomeScreen.swift
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI
import Shared

struct HomeScreen: View {
    
    @EnvironmentObject private var navStack: NavStack

    @State private var showBottomOptions = false
    
    private let sharedPref = SharedModule().sharedPref
    
    private let dateManager = DateManager()
    @StateObject private var viewModel = CalendarViewModel()
    
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    @State var selectedDate: Day? =  nil
    
    
    init() {
        sharedPref.save(key: isLoggedIn, value: true)
    }
    
    
    var body : some View {
        
        ZStack {
            ScrollView {
                VStack (alignment: HorizontalAlignment.leading){
                    Text(dateManager.today())
                        .foregroundColor(Color(hex: "F87777"))
                        .font(.custom(Caros.medium.font, size: 28))
                        .padding(.top, 24)
                    
                    Text(dateManager.dateString())
                        .font(.custom(Caros.bold.font, size: 32))
                        .padding(.top, 16)
                    
                    VStack {
                        HStack{
                            // ‑‑ Previous month
                            Button(action: viewModel.goToPreviousMonth) {
                                Image(systemName: "chevron.left")
                                    .font(.title3)
                                    .tint(Color(hex: "63605F"))
                                
                            }
                            .accessibilityLabel(Text("Previous Month"))
                            
                            Spacer()
                            
                            Text(viewModel.monthYearString())
                                .font(.custom("Caros Bold", size: 24))
                                .foregroundColor(Color(hex: "63605F"))
                            
                            Spacer()
                            
                            // ‑‑ Next month
                            Button(action: viewModel.goToNextMonth) {
                                Image(systemName: "chevron.right")
                                    .font(.title3)
                                    .tint(Color(hex: "63605F"))
                                
                            }
                            .accessibilityLabel(Text("Next Month"))
                            
                        }.padding(.horizontal, 6)
                        
                        Spacer(minLength: 24)
                        
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(0..<7) { i in
                                let hexColor = if (i == 0 || i == 6) {"F23834"} else {"B3B3B3"  }
                                Text(weekdays[i])
                                    .font(.custom("Caros Medium", size: 16))
                                    .foregroundColor(Color(hex: hexColor))
                            }
                            
                            ForEach(viewModel.days) { day in
                                let isToday       = Calendar.current.isDateInToday(day.date)
                                let isSelectable  = day.isInCurrentMonth       // whatever rule you want
                                let dayNumber     = Calendar.current.component(.day, from: day.date)
                                
                                let isWeekend   = Calendar.current.isDateInWeekend(day.date)   // ← Saturday OR Sunday
                                let inMonth     = day.isInCurrentMonth
                                
                                
                                var isSameDay: Bool {
                                    guard let selected = selectedDate else { return false }
                                    return Calendar.current.isDate(selected.date, inSameDayAs: day.date)
                                }
                                
                                Button {
                                    // 💡 Handle the tap here
                                    print("\(dayNumber) is Clicked")
                                    selectedDate = day
                                    
//                                     viewModel.didSelect(date: day.date)
                                } label: {
                                    Text(isSelectable ? "\(dayNumber)" : "")
                                        .font(.custom(isToday ? "Caros Bold" : "Caros Medium", size: 14))
                                        .frame(maxWidth: .infinity, minHeight: 40)
                                    // background rules
                                        .background(
                                            isSameDay && inMonth ? Color.red :
                                            isToday && inMonth  ? Color.blue.opacity(0.2) :
                                                isWeekend && inMonth ? Color.red.opacity(0.1) :
                                                Color.clear
                                        )
                                        .foregroundColor(
                                            isSameDay ? .white :
                                            isWeekend && inMonth ? .red : .primary
                                        )
                                    
                                        .clipShape(Circle())
                                }
                                .buttonStyle(.plain)
                                .disabled(dateManager.isPastDate(day.date))
                            }
                            
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.white)
                    ).padding(.top, 16)     // V - Stack - Calender Card
                    
                    HStack {
                        VStack {
                            Text("Completed \nTask")
                                .font(.custom("Caros Medium", size: 20))
                                .multilineTextAlignment(TextAlignment.center)
                            
                            Text("04")
                                .font(.custom("Caros Bold", size: 24))
                                .padding(.top, 1)
                            
                        }  .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color(hex: "F0D1A8"))
                            )
                        
                        VStack {
                            
                            Text("Pending \nTask")
                                .font(.custom("Caros Medium", size: 20))
                                .multilineTextAlignment(TextAlignment.center)
                            
                            Text("04")
                                .font(.custom("Caros Bold", size: 24))
                                .padding(.top, 1)
                        }.frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .fill(Color(hex: "C4A49F"))
                            )
                    }.padding(.top, 24)      // HStack  -  Tasks Card
                }.padding(.top, 50).padding(.bottom, 16)    // Scroll_Bar - VStack
                    .padding(.horizontal, 16)
                    .  frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .leading)
                
            }   // inner - Scroll Bar
            
            
            
            
            
        }.ignoresSafeArea()     // Z-Stack - Top Level
            .background(Color(hex: "FAF7F2"))
            .toolbar(.hidden, for: .navigationBar)
            .overlay(
                HStack(alignment: VerticalAlignment.center) {
                    Button(action: { showBottomOptions = true }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .tint(Color(hex: "7E8491"))
                        
                    }.padding(.leading, 18)
                        .frame(width: 48, height: 48)
                    
                    Button(action: {
                        viewModel.getToDoCount()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .tint(Color(hex: "7E8491"))
                        
                        
                    }.padding(.leading, 4)
                        .frame(width: 48, height: 48)
                    
                    Spacer()
                    
                    Button(action: {
                        navStack.navigate(.choose_category)
                    }) {
                        Image(systemName: "plus")
                            .font(.title3)
                            .tint(Color.white)
                        
                    }.frame(width: 56, height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(Color(hex: "00A86B"))
                        ).padding(.trailing,18)
                    
                    
                }.padding(.top, 10)
                    .background(Color.white),
                alignment: .bottom
            ).sheet(isPresented:  $showBottomOptions) {
                HomeOptionsBottomSheet() { section in
                    showBottomOptions = false
                    
                    switch section {
                    case .statistics:
                        navStack.navigate(.statistics)
                    case .task:
                        navStack.navigate(.task_group)
                    case .settings:
                        navStack.navigate(.settings)
                    }
                    
                }
                    .presentationDetents([.medium, .large]) // Add this for bottom sheet behavior
                    .presentationDragIndicator(.visible)
            }
    }
    
}

#Preview {
    HomeScreen()
}
