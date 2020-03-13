import UIKit

//Difference between UITableViewController and
// : ViewController, UITableViewDelegate, UITableViewDataSource
class FriendsViewController: UITableViewController {
    let cellId = "cellId"
    let animal = ["dog", "cat", "cow", "sheep", "lol"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
    //Registers a class for use in creating new table cells.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    
    }
}

extension FriendsViewController {
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = animal[indexPath.row]
  
        return cell
    }
}
