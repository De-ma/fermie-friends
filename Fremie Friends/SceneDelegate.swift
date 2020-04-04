import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
//        if let windowScene = scene as? UIWindowScene {
//
//            let window = UIWindow(windowScene: windowScene)
//
//            window.rootViewController =  UINavigationController(rootViewController: FriendsListViewController())
//
//            self.window = window
//            window.makeKeyAndVisible()
//        }
        
        
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
//        guard let secondaryAsNavController =
//            secondaryViewController as? UINavigationController else { return false }
//        guard let topAsDetailController =
//            secondaryAsNavController.topViewController as? DetailViewController else { return false }
//        if topAsDetailController.detailItem == nil {
//            // Return true to indicate that you have handled the collapse by doing nothing; the secondary controller will be discarded.
//            return true
//        }
        return false
    }
}

