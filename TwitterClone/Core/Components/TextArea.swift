//
//  TextArea.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/13.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if text.isEmpty{
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}
