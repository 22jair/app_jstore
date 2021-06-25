//
//  Extensions.swift
//  JStore
//
//  Created by user190858 on 6/23/21.
//

import UIKit

extension UIViewController {
    
    func showAler(title: String, message: String?){
       
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
}
