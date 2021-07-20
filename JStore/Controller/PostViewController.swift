//
//  PostViewController.swift
//  JStore
//
//  Created by user190858 on 7/19/21.
//

import UIKit
import FirebaseAuth



class PostViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
   
   
    
    @IBOutlet weak var titleTxte: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var priceTxt: UITextField!
    @IBOutlet weak var numberTxt: UITextField!
    @IBOutlet weak var placeTxt: UITextField!
    var imageData: Data?
    let userViewModel = UserViewModel()
    let postVM = PostViewModel()
    let firebaseUtil = FirebaseUtils()
    
    let pickerController = UIImagePickerController()
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func chooseImageBtn(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
    }
    
   
    @IBAction func createPost(_ sender: Any) {
        
        let title = titleTxte.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let description = descriptionTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let price = priceTxt.text!.trimmingCharacters(in: .newlines)
        let number = numberTxt.text!.trimmingCharacters(in: .newlines)
        let place = placeTxt.text!.trimmingCharacters(in: .newlines)
        let userId = userViewModel.getCurrentUserUid()
        let uuid = UUID().uuidString
        let path = "img/\(userId)/posts/\(uuid)"
        
        guard let img = self.imageData else {
            
            
                let newPost = Post(uid: uuid, userId: userId , title: title, description: description, price: price, number: number, place: place, image: nil)
                
                let postVM = PostViewModel()
                postVM.createPost(post: newPost)
                
            return
        }
        
        firebaseUtil.saveFileStorage(data: img , path: path) { (url) in
        
            // new Post
            let newPost = Post(uid: uuid, userId: userId , title: title, description: description, price: price, number: number, place: place, image: nil)
            
            self.postVM.createPost(post: newPost)
        }
        
    }
    
}
