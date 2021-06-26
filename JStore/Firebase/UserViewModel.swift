//
//  UserViewModel.swift
//  JStore
//
//  Created by JairArteaga on 6/23/21.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserViewModel {
    
    private var db = Firestore.firestore()
    
    func createUser(user: User) {
        
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: user.getDict()) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        	
    }
}
