//
//  WebView.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/15.
//

import SwiftUI
import WebKit
import Foundation

struct WebView: UIViewRepresentable {
    @EnvironmentObject var webViewModel: WebViewModel

    var url: String
    @Environment(\.presentationMode) var presentationMode

    // TODO: Use enum Action: Int, CaseIterable
    enum Action {
         case none
         case goBack
         case goForward
         case reload
         case close
     }

    @Binding var action: Action

    func updateUIView(_ uiView: WKWebView, context: Context) {
        switch action {
        case .goBack:
            uiView.goBack()
        case .goForward:
            uiView.goForward()
        case .reload:
            uiView.reload()
        case .close:
            presentationMode.wrappedValue.dismiss()
        case .none:
            break
        }
        action = .none
    }
    
    func makeCoordinator() -> WebView.Coordinator {
        Coordinator(self, webViewModel)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(request)
        
        return webView
    }
}

extension WebView {
    class Coordinator: NSObject, WKNavigationDelegate {
        
        @ObservedObject private var webViewModel: WebViewModel
        private let parent: WebView
        
        init(_ parent: WebView, _ webViewModel: WebViewModel) {
            self.parent = parent
            self.webViewModel = webViewModel
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation
                     navigation: WKNavigation!) {
            webViewModel.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webViewModel.isLoading = false
            webViewModel.title = webView.title ?? ""
            webViewModel.canGoBack = webView.canGoBack
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            webViewModel.isLoading = false
        }
    }
}
