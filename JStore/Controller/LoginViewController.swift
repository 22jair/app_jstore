//
//  LoginViewController.swift
//  JStore
//
//  Created by Jair Arteaga on 5/26/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var viewContent: UIView!
    
    
    @IBOutlet weak var cnsCenterYContentLogin: NSLayoutConstraint!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }

    
    // Import de Inputs
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    
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
    
    
    
    @IBAction func signInButtomAction(_ sender: Any) {
    
    
        if let email = emailTxt.text, let password =  passwordTxt.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                let errMsg = CommonUtility.getAuthErrorMessage(error)
                
                if let result = result, error == nil{
                    
                    //self.navigationController?.pushViewController(PruebaFirebaseController(email: result.user.email!), animated: true)
                    self.performSegue(withIdentifier: "goToApp", sender: nil)
                    
                    
                }else{
                    
                    
                    
                    let alertController = UIAlertController(title: "Error", message: errMsg, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


//dummy extension
extension LoginViewController {
    
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
                self.cnsCenterYContentLogin.constant = keyboardFrame.origin.y - finalPosyContent
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: duration) {
            self.cnsCenterYContentLogin.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
