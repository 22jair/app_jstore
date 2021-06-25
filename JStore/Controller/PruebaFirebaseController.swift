//
//  PruebaFirebaseController.swift
//  JStore
//
//  Created by Jair Arteaga on 5/26/21.
//

import UIKit
import FirebaseAuth



class PruebaFirebaseController: UIViewController {
    
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    private let email: String

    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Initcoder: has not been implemented")
    }
    
    
    @IBAction func closeBtnAction(_ sender: Any) {
    }
    
}
