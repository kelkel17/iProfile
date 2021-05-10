//
//  LoginView.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var model = AuthModel()
    
    var body: some View {
        VStack {
            CustomTextField(image: "person", placeholder: "Email", text: $model.email)

            Spacer().frame(height: 20)

            CustomTextField(image: "lock", placeholder: "Password", text: $model.password)
            
            Spacer().frame(height: 20 * 2)

            Button(action: model.login, label: {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(Color.black)
                    .clipShape(Capsule())
            })
        }
        .background(
            Image(uiImage: #imageLiteral(resourceName: "loginBackgroundJ"))
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        .alert(isPresented: $model.alert, content: {
            Alert(title: Text("Message"), message: Text(model.alertMessage), dismissButton: .destructive(Text("OK")))
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
