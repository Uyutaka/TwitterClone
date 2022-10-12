//
//  FeedView.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/12.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        ScrollView{
            LazyVStack{
                ForEach(0...20, id: \.self){
                    _ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
