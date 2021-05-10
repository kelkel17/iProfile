//
//  RegisterView.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    @ObservedObject var model: AuthModel

    var body: some View {
        ZStack {
            Button(action: { model.isSignUp.toggle() }, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .position(x: 20, y: 10)
            })

            VStack {
                VStack(spacing: 20) {
                    CustomTextField(image: "person", placeholder: "Email", text: $model.emailSignUp)
                    
                    CustomTextField(image: "lock", placeholder: "Password", text: $model.passwordSignUp)
                    
                    CustomTextField(image: "lock", placeholder: "Re-Enter Password", text: $model.passwordSignUp)
                }
                
                Button(action: model.register, label: {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.black)
                        .clipShape(Capsule())
                })
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(model: AuthModel())
    }
}
