//
//  AuthModel.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI
import Firebase

class AuthModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var alert = false
    @Published var alertMessage = ""
    
    // User Status
    @AppStorage("log_status") var status = false

    func login() {
        if email == "" || password == "" {
            self.alertMessage = "Inputs should be filled properly"
            self.alert.toggle()
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.alertMessage = error!.localizedDescription
                self.alert.toggle()
                return
            }
            
            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified {
                self.alertMessage = "Please verify your email"
                self.alert.toggle()

                try! Auth.auth().signOut()

                return
            }
            
            withAnimation {
                self.status = true
            }
        }
    }
    
    func logout() {
        try! Auth.auth().signOut()
        
        withAnimation {
            self.status = false
        }
        
        email = ""
        password = ""
    }
}
