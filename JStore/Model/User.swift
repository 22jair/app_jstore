//
//  User.swift
//  JStore
//
//  Created by Jair Arteaga on 6/23/21.
//

import Foundation


class User: Codable {
    
    var uid: String?
    var firstname: String?
    var lastname: String?
    var email: String?
    var posts: [String]?

 
    
    init(uid: String, firstname: String, lastname: String, email: String, posts: [String] = [String]()) {
        
        self.uid = uid
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.posts = posts
      
    }
    
    init(){
        
    }
    
}
