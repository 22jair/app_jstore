//
//  SignUpViewController.swift
//  JStore
//
//  Created by user190858 on 5/26/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var viewContent: UIView!
    
    @IBOutlet weak var cnsCenterYContent: NSLayoutConstraint!
    
    
    //import inputs
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    //actions
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }
        
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.registerKeyboardNotification()
    }
        
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         self.unregisterKeyboardNotification()
    }
    
    
    @IBAction func singUpBtnAction(_ sender: Any) {
        
        let email = emailTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let firstname = nameTxt.text!.trimmingCharacters(in: .newlines)
        let lastname = lastNameTxt.text!.trimmingCharacters(in: .newlines)
       
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            let errMsg = CommonUtility.getAuthErrorMessage(error)

            
                if let result = result, error == nil{
                    
                    self.showAler(title: "Mensaje", message: "Registrado Correctamente")
                    //self.navigationController?.popToRootViewController(animated: true)
                    
                 //   self.navigationController?.pushViewController(PruebaFirebaseController(email: result.user.email!), animated: true)

                    
                }else{
                    
                    self.showAler(title: "Error", message: errMsg)
                    
                }
            }
        
    
    }
    
    
    
    
    
}













extension SignUpViewController {
    
    func registerKeyboardNotification() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterKeyboardNotification() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
    
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        let finalPosyContent = self.viewContent.frame.origin.y + self.viewContent.frame.size.height
        
        if keyboardFrame.origin.y < finalPosyContent {
            
            UIView.animate(withDuration: duration) {
                self.cnsCenterYContent.constant = keyboardFrame.origin.y - finalPosyContent
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: duration) {
            self.cnsCenterYContent.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
