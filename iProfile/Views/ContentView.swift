//
//  ContentView.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import UIKit
import SwiftUI
import Firebase

struct ContentView: View {
    @State var model = AuthModel()
    @State var user = User()
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var url: URL?
    
    private var EditProfile: some View {
        VStack(alignment: .center, spacing: 10){
            Button(action: {
                self.showingImagePicker = true
            }, label: {
                if image != nil {
                    image?
                        .resizable()
                        .roundImage()
                    
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .roundImage()
                }
                
            })
            
            CustomTextField(image: "person", placeholder: "Full name", text: $user.name)
            
            CustomTextField(image: "person", placeholder: "Full name", text: $user.name)
            
            Button(action: { user.editProfile(url!) }, label: {
                Text("Button")
            })
        }
    }

    var body: some View {
        VStack(spacing: 25) {
            if Auth.auth().currentUser?.displayName == nil {
                EditProfile
                    .customBackground()
                    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                        ImagePicker(image: self.$inputImage, url: self.$url)
                    }
            }
            
            Button(action: model.logout, label: {
                Text("Logout")
            })
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
