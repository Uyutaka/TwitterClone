//
//  UserService.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/14.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService{
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        print("DEBUG: Fetch user info..")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument{ snapshot, _ in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
}
