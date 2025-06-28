//
//  HomeScreen.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI
import Shared

struct HomeScreen: View {

    private let sharedPref = SharedModule().sharedPref
    
    init() {
        sharedPref.save(key: isLoggedIn, value: true)
    }
    
    var body : some View {
        ScrollView {
            VStack {
                Text("Home Screen")
                
            }
            
        }.toolbar(.hidden, for: .navigationBar)
    
    }
    
}

#Preview {
    HomeScreen()
}
