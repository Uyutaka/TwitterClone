//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/13.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String){
        print("DEBUG: Login with email \(email)")

    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        print("DEBUG: Register with email \(email)")

    }
}
