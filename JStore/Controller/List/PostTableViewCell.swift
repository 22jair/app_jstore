//
//  PostTableViewCell.swift
//  JStore
//
//  Created by user190858 on 7/21/21.
//

import UIKit

class PostTableViewCell: UITableViewCell{
    
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!
    @IBOutlet weak private var lblPrice: UILabel!
    
    var objPost: Post!{
        didSet { self.updateData() }
    }
    
    private func updateData(){
        self.lblTitle.text =  self.objPost.title
        self.lblDescription.text = self.objPost.description
        self.lblPrice.text = self.objPost.price
    }
    
}
