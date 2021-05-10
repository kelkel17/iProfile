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
                LoginView(model: model)
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
