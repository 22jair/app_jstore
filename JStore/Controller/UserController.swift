
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
        
        let docRef = db.collection("users").whereField("uid", isEqualTo: userId)
        
        docRef.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    let document = querySnapshot!.documents[0]
                      
                    self.userNames.text = document.get("firstname") as? String
                    self.userLastName.text = document.get("lastname") as? String
                    self.userEmail.text =  document.get("email") as? String
                    
                }
        
       

        }
    
    }
    
    
    
    
    
    @IBAction func btnCloseSession(_ sender: Any) {
        guard let controller =  self.navigationController?.viewControllers.first(where: { $0 is LoginViewController }) else { return }
         
         self.navigationController?.popToViewController(controller, animated:true)
    }
    
}
