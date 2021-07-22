//
//  PostDetailViewController.swift
//  JStore
//
//  Created by user190858 on 7/22/21.
//


import UIKit
import Alamofire

class PostDetailViewController: UIViewController {
    
    var objPost = Post()
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postPlace: UILabel!
    @IBOutlet weak var postPrice: UILabel!
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        postTitle.text = self.objPost.title
        postDescription.text = self.objPost.description
        postPlace.text = self.objPost.place
        postPrice.text = self.objPost.price
        
        guard let url_image = URL(string: self.objPost.image ?? "") else { return }
        let url_img_request = URLRequest(url: url_image as URL)
        
        AF.request(url_img_request).response { responseData in
            
            guard let data = responseData.data else { return }
            let image = UIImage(data: data)
            self.postImg.image = image
        }
     
    }
    

}

