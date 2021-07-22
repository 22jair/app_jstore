
import UIKit
import FirebaseAuth
import Firebase


class UserController: UIViewController {
    
    
    
    @IBOutlet weak var userNames: UILabel!
    @IBOutlet weak var userLastName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    private var db = Firestore.firestore()
    let userViewModel = UserViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userId = userViewModel.getCurrentUserUid()
        
        let docRef = db.collection("users").document(userId)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                do {
                    self.userNames.text = document.get("firstname") as? String
                    self.userLastName.text = document.get("lastname") as? String
                    self.userEmail.text =  document.get("email") as? String

                } catch { print(error) }

            } else {
                print("Document does not exist")
            }
        }
        

        
    }
    
    
    
    
    
    
    @IBAction func btnCloseSession(_ sender: Any) {
        guard let controller =  self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) else { return }
         
         self.navigationController?.popToViewController(controller, animated:true)
    }
    
}
