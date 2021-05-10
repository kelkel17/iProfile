//
//  ContentView.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var model = AuthModel()

    var body: some View {
        VStack(spacing: 25) {
            Text("Logged in as \(Auth.auth().currentUser?.email ?? "")")
            
            Button(action: model.logout, label: {
                Text("Logout")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
