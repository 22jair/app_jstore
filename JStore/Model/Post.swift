//
//  User.swift
//  JStore
//
//  Created by Jair Arteaga on 6/23/21.
//

import Foundation


class Post {
    
    var uid: String?
    var user: User = User()?
    var title: String?
    var description: String?
    var price: String?
    var number: String?
    var place: String?
    var image: String?
    
    init(uid: String, user: User, title: String, description: String, price: String, number: String, place: String, image:String?) {
        
        self.uid = uid
        self.user = user
        self.title = title
        self.description = description
        self.price = price
        self.number = number
        self.place = place
        self.image = image
    }
    
    func getDict() -> [String : Any] {
        return [
            "uid": uid as Any,
            "user":user as Any,
            "title":title as Any,
            "description":description as Any,
            "price": price as Any,
            "number": number as Any,
            "place": place as Any,
            "image":image as Any
            
        ]
     }

}
