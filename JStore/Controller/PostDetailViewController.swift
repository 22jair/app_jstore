//
//  PostDetailViewController.swift
//  JStore
//
//  Created by user190858 on 7/22/21.
//


import UIKit

class PostDetailViewController: UIViewController {
    
    var objPost = Post()
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}

