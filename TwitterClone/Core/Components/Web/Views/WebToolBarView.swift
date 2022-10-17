//
//  WebToolBarView.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/15.
//

import SwiftUI

struct WebToolBarView: View {
    @Binding var action: WebView.Action
    @EnvironmentObject var webViewModel: WebViewModel
    
    var body: some View {
        VStack() {
            HStack() {
                Button("Back"){ action = .goBack }
                    .disabled(!webViewModel.canGoBack)
                    .foregroundColor(webViewModel.canGoBack ? Color(.systemGray) : Color(.white))
                Button("Forward") { action = .goForward }
                Button("Reload") { action = .reload }
                Button("Close") { action = .close }
            }
        }
    }
}
