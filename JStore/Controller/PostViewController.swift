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
    let image: String = "";
    
    let userViewModel = UserViewModel()
    let postViewModel = PostViewModel()
    
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
        
        let uuid = UUID().uuidString
       
        let userId = userViewModel.getCurrentUserUid()
        let user = User(uid:userId)
        
        // new Post
        let newPost = Post(uid: uuid, user: user , title: title, description: description, price: price, number: number, place: place, image: nil)
        
        let postVM = PostViewModel()
        postVM.createPost(post: newPost)
        
    }
    
}
