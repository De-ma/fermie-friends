import Foundation
import UIKit

class MasterViewController: UITableViewController {
    
    let settings = ["Feeding Settings", "Notifications", "Photos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Dema")
        
    }
    
    @objc func goBack() {
        self.splitViewController?.showDetailViewController(FriendsListViewController(), sender: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dema", for: indexPath)
        cell.textLabel?.text = settings[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.splitViewController?.showDetailViewController(DetailViewController(), sender: self)
    }
}

