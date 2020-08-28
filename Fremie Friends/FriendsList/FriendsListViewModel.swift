import Foundation
import CoreData
import UIKit

class FriendsListViewModel {
    
    let cellId = "cell"
    let entityName = "Friend"
    var friends: [NSManagedObject] = []
    
    // we can init with a persistent contianer
    // so we can test it with a mocked passed thing ( think dependency injection )
    // write some testoronis
    // What do you want to do with the errors? Should you show them to the user? Should you not?

    func fetchFriends() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)

        do {
            friends = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Couldnt not fetch, stop trying to make it happen. \(error), \(error.userInfo)")
        }
    }

    func saveFriend(friend: LocalFriend) {
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
