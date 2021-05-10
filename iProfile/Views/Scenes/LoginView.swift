//
//  LoginView.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var model = AuthModel()
    
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
            
            HStack(spacing: 12) {
                Text("Don't have an account yet?")
                    .foregroundColor(Color.white.opacity(0.7))
                
                Button(action: { model.isSignUp.toggle() }, label: {
                    Text("Sign Up Now")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: AuthModel())
    }
}
