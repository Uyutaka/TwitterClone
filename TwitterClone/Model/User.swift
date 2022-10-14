//
//  User.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/14.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
