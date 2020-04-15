import Foundation
import UIKit
import CoreData

class FriendsListViewController: UITableViewController {
    
    let friendsListViewModel = FriendsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: friendsListViewModel.cellId)
        tableView.isScrollEnabled = false
        
        //add the navigation thing
        self.title = "Fermie Friends!"
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newFriend)), animated: true)
        self.navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(showMaster)), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        friendsListViewModel.fetchFriends()
    }

    @objc func newFriend() {
        let newFriendViewController = NewFriendViewController()
        self.navigationController?.pushViewController(newFriendViewController, animated: true)
        newFriendViewController.completionHandler = { friend in
            
            self.friendsListViewModel.saveFriend(friend: friend)
            self.tableView.reloadData()
            return "all good in the hood"
        }
    }
    
    @objc func showMaster() {
        let masterViewController = MasterViewController()
        self.navigationController?.modalPresentationStyle = .pageSheet
        self.navigationController?.present(masterViewController, animated: true, completion: nil)
    }
}

extension FriendsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsListViewModel.friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: friendsListViewModel.cellId, for: indexPath) as! ItemTableViewCell //FORCE CAST !!!
        
        let friend = friendsListViewModel.friends[indexPath.row]
        let friendType = friend.value(forKey: "type") as? String
        
        cell.itemImage.image = UIImage(named: friendType?.lowercased() ?? "kombucha") //change default maybe to ?
        return cell
    }
}

extension FriendsListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
