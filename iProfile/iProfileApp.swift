//
//  iProfileApp.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI
import Firebase

@main
struct iProfileApp: App {
    @AppStorage("log_status") var status = false
    @StateObject var model = AuthModel()
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if status {
                ContentView()
            } else {
                if model.isSignUp {
                    RegisterView(model: model)
                        .background(
                            Image(uiImage: #imageLiteral(resourceName: "loginBackgroundJ"))
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        )
                        .alert(isPresented: $model.alert, content: {
                            Alert(title: Text("Message"), message: Text(model.alertMessage), dismissButton: .destructive(Text("OK")))
                        })
                } else {
                    LoginView(model: model)
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
        }
    }
}
 
class Delegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
