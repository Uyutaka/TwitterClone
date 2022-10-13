//
//  TwitterCloneApp.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/12.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoginView()
            }
        }
    }
}
