//
//  PruebaFirebaseController.swift
//  JStore
//
//  Created by Jair Arteaga on 5/26/21.
//

import UIKit
import FirebaseAuth



class HomveViewController: UIViewController {
   
    
    
   

}

extension HomveViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "celdaPost"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
         
        
        return cell
    }
    
    
    
    
    
}

