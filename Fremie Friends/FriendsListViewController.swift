import Foundation
import UIKit
import CoreData

class FriendsListViewController: UITableViewController {
        
    var cellId = "cell"
    var friends: [NSManagedObject] = []
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
        //add the navigation thing
        self.title = "Fermie Friends!"
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newFriend)), animated: true)
    }
    
    @objc func newFriend() {
        let newFriendViewController = NewFriendViewController()
        self.navigationController?.pushViewController(newFriendViewController, animated: true)
        newFriendViewController.completionHandler = { friend in
            
            self.saveFriend(friend: friend)
            self.tableView.reloadData()
            return "all good in the hood"
        }

    }
    
    func saveFriend(friend: localFriend) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        //get the data
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //add an entity
        let entity = NSEntityDescription.entity(forEntityName: "Friend", in: managedContext)! //force unwrap :(
        
        let friendToAdd = NSManagedObject(entity: entity, insertInto: managedContext)
        
        friendToAdd.setValue(friend.localName, forKey: "name")
        friendToAdd.setValue(friend.localType, forKey: "type")
        friendToAdd.setValue(friend.localBirthday, forKey: "birthday")
        
        do {
            try managedContext.save()
            friends.append(friendToAdd)
        } catch let error as NSError {
            print("Saving FAILED. \(error), \(error.userInfo)")
        }

        
        
    }
}

extension FriendsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ItemTableViewCell //FORCE CAST !!!
        
        let friend = friends[indexPath.row]
        
        cell.itemTitle.text = friend.value(forKey: "name") as? String
        let friendType = friend.value(forKey: "type") as? String
        
        cell.itemImage.image = UIImage(named: friendType?.lowercased() ?? "kombucha") //change default maybe to ?
        return cell
    }
}

extension FriendsListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friends[indexPath.row]
        guard let notificationType = friend.value(forKey: "name") as? String else { return }
        
        self.appDelegate?.scheduleNotification(notificationType: notificationType)
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
