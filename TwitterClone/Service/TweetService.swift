//
//  TweetService.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/14.
//

import Firebase
struct TweetService{
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "capition": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        Firestore.firestore().collection("tweets").document()
            .setData(data){ error in
                if let error = error {
                    print("DEBUG: Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
}
