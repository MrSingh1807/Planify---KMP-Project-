//
//  AddTaskScreen.swift
//  iosApp
//
//  Created by Mayank Singh on 12/07/25.
//

import SwiftUI

struct AddTaskScreen: View {
    
    
    @EnvironmentObject private var navStack: NavStack
    
    @State var title: String = "title"
    @State var description: String = ""
    @State var selectedDate: TimeInterval = 1752513394
    
    @State var priority : Priority = Priority.low
    
    let dateManager = DateManager()
    
    @State private var selectDate = Date()
    @State private var showCalendar = false
    
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
                
                Text("Create a new task")
                    .font(.custom(Caros.bold.font, size: 20))
                
                Spacer()
                
            }
            
            ScrollView {
                Divider()
                VStack(alignment: .leading) {
                    
                    Text("Title")
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
                    
                    
                    HStack {
                        Text("Category: ")
                            .font(.custom(Caros.bold.font, size: 16))
                        
                        Text("Hobby")
                            .font(.custom(Caros.medium.font, size: 14))
                        
                        
                        
                    }.padding(.top, 24)
                    
                    
                    Text("Date & Time")
                        .font(.custom(Caros.bold.font, size: 16))
                        .padding(.top, 24)
                    
                    HStack{
                        Text( dateManager.formatTimestampToDateString(format: "dd MMMM, EEEE", selectedDate) )
                            .font(.custom(Caros.medium.font, size: 14))
                            .frame( maxWidth: .infinity,alignment: .leading)
                            .padding(8)
                            .padding(.leading, 8)
                           
                            .padding(.top, 8)
                        
                        Image("ic_calender").padding(.trailing, 12)
                            .onTapGesture {
                                showCalendar = true
                            }
                        
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                        
                    )
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Start time")
                                .font(.custom(Caros.bold.font, size: 16))
                                .padding(.top, 24)
                            
                            DropdownView()
                        }.frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading) {
                            Text("End time")
                                .font(.custom(Caros.bold.font, size: 16))
                                .padding(.top, 24)
                            DropdownView()
                            
                        }.frame(maxWidth: .infinity)
                        
                    }
                    
                    Text("Priority")
                        .font(.custom(Caros.bold.font, size: 16))
                        .padding(.top, 24)
                    
                    HStack {
                        
                        Button {
                            priority = .low
                        } label: {
                            Text("Low")
                                .font(.custom(
                                    priority == .low ? Caros.bold.font : Caros.regular.font, size: 14))
                        }.frame( maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                Group {
                                    priority == .low  ? Color.gray.opacity(0.2) : Color.clear
                                }
                            ).cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(priority == .low ? Color.clear : Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .buttonStyle(.plain)
                        
                        Button {
                            priority = .medium
                        } label: {
                            Text("Medium")
                                .font(.custom(
                                    priority == .medium ? Caros.bold.font : Caros.regular.font, size: 14))
                        }.frame( maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                Group {
                                    priority == .medium  ? Color.gray.opacity(0.2) : Color.clear
                                }
                            ).cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(priority == .medium ? Color.clear : Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .buttonStyle(.plain)
                        
                        
                        Button {
                            priority = .high
                        } label: {
                            Text("High")
                                .font(.custom(
                                    priority == .high ? Caros.bold.font : Caros.regular.font, size: 14))
                            
                        }.frame( maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                Group {
                                    priority == .high  ? Color.gray.opacity(0.2) : Color.clear
                                }
                            ).cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(priority == .high ? Color.clear : Color.gray.opacity(0.5), lineWidth: 1)
                            )
                            .buttonStyle(.plain)
                        
                    } .padding(.top, 8)
                    
                   
                    Text("Description")
                        .font(.custom(Caros.bold.font, size: 16))
                        .padding(.top, 24)
                    
                    TextField("Type here!\n\n", text: $description)
                        .font(.custom(Caros.medium.font, size: 14))
//                        .frame(minHeight: lineHeight(for: 5), maxHeight: lineHeight(for: 8))
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
                            .padding(.vertical, 14)
                        
                    }.frame(maxWidth: .infinity)
                        .background(Event.lifestyle.color)
                        .cornerRadius(8)
                        .padding(.vertical, 16)
                    
                }.padding(16)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "F5F7FA"))
            
            
            
            
            
        }.toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $showCalendar) {
                      CalendarPickerSheet(
                          selectedDate: $selectDate,
                          isPresented: $showCalendar
                      )
                  }
        
    }
    
    
    // Rough estimate: ~20 points per line (depends on font)
    private func lineHeight(for lines: Int) -> CGFloat {
        return CGFloat(lines) * 20
    }
    
   
    struct CalendarPickerSheet: View {
        @Binding var selectedDate: Date
        @Binding var isPresented: Bool
        
        var body: some View {
            NavigationView {
                VStack {
                    DatePicker(
                        "Select Date",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .padding()
                    
                    Spacer()
                }
                .navigationTitle("Choose a Date")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresented = false
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresented = false
                        }
                    }
                }
            }
        }
    }

    
    struct DropdownView: View {
        @State private var selectedOption = "00:00 AM"
        
        let options = [
            "00:00 AM", "01:00 AM", "02:00 AM", "03:00 AM", "04:00 AM", "05:00 AM",
            "06:00 AM", "07:00 AM", "08:00 AM", "09:00 AM", "10:00 AM", "11:00 AM",
            "12:00 PM", "01:00 PM", "02:00 PM", "03:00 PM", "04:00 PM", "05:00 PM",
            "06:00 PM", "07:00 PM", "08:00 PM", "09:00 PM", "10:00 PM", "11:00 PM"
        ]
        
        var body: some View {
            Picker("Select an option", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }.frame(maxWidth: .infinity, maxHeight: 16)
                .pickerStyle(MenuPickerStyle()) // 🔽 Makes it a dropdown
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
    
}

#Preview {
    AddTaskScreen()
}
