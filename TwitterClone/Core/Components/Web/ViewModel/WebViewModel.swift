//
//  WebViewModel.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/15.
//

import Foundation

class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var title: String = ""
}
