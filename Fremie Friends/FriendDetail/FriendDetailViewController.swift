import Foundation
import UIKit


class FriendDetailViewController: UIViewController {
    
    private var fermentationImageView = UIImageView()
    private var fermentationImage = UIImage()
    
    private var fermentationNameLabel = UILabel()
    
    var name = ""
    var feedTime = ""
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
}
