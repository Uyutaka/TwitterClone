//
//  Tweet.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/14.
//

import Firebase
import FirebaseFirestoreSwift
struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
