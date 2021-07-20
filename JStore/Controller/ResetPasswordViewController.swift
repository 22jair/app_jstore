//
//  ResetPasswordViewController.swift
//  JStore
//
//  Created by JairArtaega on 5/26/21.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnReset: UIButton!
    
    
    @IBAction func goLogin(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnResetEmailAction(_ sender: Any) {
        
        let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            let errMsg = CommonUtility.getAuthErrorMessage(error)
            
            if error == nil{
                               
              
                self.navigationController?.pushViewController(ResetPasswordMessageViewController(), animated: true)

                
            } else {
                
                self.showAler(title: "Error", message: errMsg)

                
            }

            
        }
        
    }
    
    
}

