//
//  PostListViewController.swift
//  JStore
//
//  Created by user190858 on 7/19/21.
//

import UIKit
class PostLisViewController: UIViewController{
    
    
    
}

extension PostLisViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "celdaPost"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
         
        
        return cell
    }
    
    
    
    
    
}
