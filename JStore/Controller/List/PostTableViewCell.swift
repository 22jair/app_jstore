//
//  PostTableViewCell.swift
//  JStore
//
//  Created by user190858 on 7/21/21.
//

import UIKit
import Alamofire

class PostTableViewCell: UITableViewCell{
    
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblDescription: UILabel!
    @IBOutlet weak private var lblPrice: UILabel!
    @IBOutlet weak private var imgPost: UIImageView!
    
    var objPost: Post!{
        didSet { self.updateData() }
    }
    
    private func updateData(){
        self.lblTitle.text =  self.objPost.title
        self.lblDescription.text = self.objPost.description
        self.lblPrice.text = "Precio: S/." + self.objPost.price!  
        
        guard let url_image = URL(string: self.objPost.image ?? "") else { return }
        let url_img_request = URLRequest(url: url_image as URL)
        
        AF.request(url_img_request).response { responseData in
            
            guard let data = responseData.data else { return }
            let image = UIImage(data: data)
            self.imgPost.image = image
        }
        
    }
    
}
