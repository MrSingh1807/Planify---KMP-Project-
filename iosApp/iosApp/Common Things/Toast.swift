//
//  Toast.swift
//  ToDo
//
//  Created by Mayank Singh on 01/04/25.
//

import Foundation
import SwiftUI


struct Toast: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(Color.black.opacity(0.5))
            .cornerRadius(16)
            .padding(.bottom, 50)
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.5), value: message)
    }
    
}

#Preview {
    Toast(message: "Mr Singh")
}
