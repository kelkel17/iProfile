//
//  AuthModel.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI
import Firebase

class AuthModel: ObservableObject {
    @Published var email = "mickale_saturre@ligph.com"
    @Published var password = "password123"
    @Published var isSignUp = false
    @Published var emailSignUp = "mickale_saturre@ligph.com"
    @Published var passwordSignUp = "password123"
    @Published var reEnterPassword = "password123"
    @Published var isLinkSend = false
    @Published var alert = false
    @Published var alertMessage = ""
    
    // User Status
    @AppStorage("log_status") var status = false
    @Published var isLoading = false
    
    func register() {
        if emailSignUp == "" || passwordSignUp == "" || reEnterPassword == "" {
            self.alertMessage = "Inputs should be filled properly"
            self.alert.toggle()
            
            return
        }
        
        if passwordSignUp != reEnterPassword {
            self.alertMessage = "Password does not match"
            self.alert.toggle()
            
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: emailSignUp, password: passwordSignUp) { (result, error)  in
            withAnimation {
                self.isLoading.toggle()
            }
            
            if error != nil {
                self.alertMessage = error!.localizedDescription
                self.alert.toggle()
                
                return
            }
            
            result?.user.sendEmailVerification(completion: { (e) in
                if e != nil {
                    self.alertMessage = e!.localizedDescription
                    self.alert.toggle()
                    
                    return
                }
                
                self.alertMessage = "A verification has been sent, please check your email"
                self.alert.toggle()
            })
        }
    }

    func login() {
        if email == "" || password == "" {
            self.alertMessage = "Inputs should be filled properly"
            self.alert.toggle()
            
            return
        }
        
        withAnimation {
            self.isLoading.toggle()
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
        emailSignUp = ""
        passwordSignUp = ""
        reEnterPassword = ""
    }
}
