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

extension UIImageView {
    
    typealias DownloadSuccess = (_ image: UIImage?, _ urlString: String) -> Void
    
    func setImage(from urlString: String, success: @escaping DownloadSuccess) {
        
        guard let imageURL = URL(string: urlString) else { return }

        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                success(image, urlString)
            }
        }
    }
    
}
