//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Yutaka Urakami on 2022/10/14.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button{
                showImagePicker.toggle()
            } label:{
                Image(systemName: "photo")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: 180, height: 180)
                    .scaledToFit()
                    .padding(.top, 44)
            }
            .sheet(isPresented: $showImagePicker){
                ImagePicker(selectedImage: $selectedImage)
            }
            Spacer()
        }
        .ignoresSafeArea()
        
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
