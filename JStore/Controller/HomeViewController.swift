//
//  PruebaFirebaseController.swift
//  JStore
//
//  Created by Jair Arteaga on 5/26/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore



class HomeViewController: UIViewController {
   
    @IBOutlet weak var table: UITableView!
    let postVM = PostViewModel()
    private var db = Firestore.firestore()
    private var postListener: ListenerRegistration?

    var arrayPost = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getPosts()
        // self.arrayPost = [Post(uid: "321321", userId: "213231", title: "titulo jeje", description: "desc", price: "123", number: "12321", place: "lugar", image: "url", fechaCreada: Date())]
        
    }
    
    deinit {
        postListener?.remove()
    }
    
    func getPosts(){
        
        postListener = db.collection("posts").order(by: "fechaCreada", descending: true).addSnapshotListener() { querySnapshot, error in

            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    
                    do {
                        
                        let uid = diff.document.get("uid") as! String
                        let userId = diff.document.get("userId") as! String
                        let title = diff.document.get("title") as! String
                        let description = diff.document.get("description") as! String
                        let price = diff.document.get("price") as! String
                        let image = diff.document.get("image") as! String
                        
                        let place = diff.document.get("place") as! String
                        
                        let number = diff.document.get("number") as! String
                        
                        let post = Post(uid: uid, userId: userId, title: title, description: description, price: price, number: number, place: place, image: image, fechaCreada: Date())
                        
                       // let post = try diff.document.data(as: Post)
                        self.arrayPost.append(post)
                        print(diff.document.get("title") as! String)
                        
                        self.table.reloadData()

                    } catch { print(error) }
                }
                
                else if (diff.type == .removed) { }
            }

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller =  segue.destination as? PostDetailViewController, let objPost = sender as? Post{
            controller.objPost = objPost
        }
    }

}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "PostTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? PostTableViewCell
        
        cell?.objPost = self.arrayPost[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objPost = self.arrayPost[indexPath.row]
        self.performSegue(withIdentifier: "PostDetailViewController", sender: objPost)
    }
    
}
