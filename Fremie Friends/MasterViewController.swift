import Foundation
import UIKit

class MasterViewController: UITableViewController {
    
    let settings = ["Fermie Friends", "Feeding Settings", "Notifications", "Photos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(goBack)), animated: true)
    }
    
    @objc func goBack() {
        splitViewController?.showDetailViewController(FriendsListViewController(), sender: nil)
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
        
        splitViewController?.showDetailViewController(DetailViewController(), sender: nil)
    }
}

