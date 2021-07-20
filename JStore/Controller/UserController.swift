
import UIKit
import FirebaseAuth



class UserController: UIViewController {
    
    
    
    @IBAction func btnCloseSession(_ sender: Any) {
        guard let controller =  self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) else { return }
         
         self.navigationController?.popToViewController(controller, animated:true)
    }
    
}
