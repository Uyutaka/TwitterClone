//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/14.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    let service = UserService()
    
    init(){
        fetchUsers()
        
    }
    
    func fetchUsers(){
        service.fetchUsers{ users in
            self.users = users
            print("DEBUG: Users \(users)")
        }
    }
}
