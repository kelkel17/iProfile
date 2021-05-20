//
//  UserModel.swift
//  iProfile
//
//  Created by Mickale Saturre on 5/10/21.
//

import SwiftUI
import Firebase
import FirebaseStorage

class User: ObservableObject {
    @Published var name = "Mickale L. Saturre"
    @Published var skills = "SwiftUI, Laravel, PHP, JavaScript"
    @Published var socialMedia = []
    
    func editProfile(_ url: URL) {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let userId = Auth.auth().currentUser?.uid

        let upload = storageRef.child("images/\(userId!)/").putFile(from: url, metadata: nil) { (data, error) in
                        if error != nil {
                            print((error?.localizedDescription)!)

                            return
                        }

                        NotificationCenter.default.post(name: NSNotification.Name("Update"), object: nil)
                    }

        upload.observe(.success) { snapshot in
            db.collection("\(userId!)").document("details").setData([
                "name": self.name,
                "skills": self.skills
            ]) { error in
                if let error = error {
                    print("Something went wrong \(error)")
                }

            }
        }
    }
}
