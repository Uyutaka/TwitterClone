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
    @Published var didAuthenticationUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User? // Used between RegistrationView and ProfilePhotoSelectorView
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if let error = error{
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in..")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){
                    _ in
                    self.didAuthenticationUser = true
                }
        }
    }
    
    func signOut(){
        // sets user session to nil so we show login view
        userSession = nil
        
        // signs user out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image){
            profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    
                }
        }
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid, completion: { user in
            self.currentUser = user
        })
    }
}
