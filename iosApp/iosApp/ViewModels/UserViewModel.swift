//
//  UserViewModel.swift
//  ToDo
//
//  Created by Mayank Singh on 24/05/25.
//

import Foundation
import Shared

class UserViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var age: String = ""
 
//    let todoManager = SharedModule().todoManager
    
    init() {


    }
    
}
