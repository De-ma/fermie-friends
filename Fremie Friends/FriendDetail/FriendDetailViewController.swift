import Foundation
import UIKit


class FriendDetailViewController: UIViewController {
    
    private var fermentationImageView = UIImageView()
    private var fermentationImage = UIImage()
    
    private var fermentationNameLabel = UILabel()
    
    
    var name = ""
    var feedTime = ""
    var type = ""
    
    convenience init(name: String) {
        self.init()

        self.name = name
        // Do other setup
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        print(name)
        
        print("building")
        fermentationNameLabel.text = name
        fermentationNameLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        fermentationNameLabel.font = fermentationNameLabel.font.withSize(35)
        fermentationNameLabel.sizeToFit()
        
        fermentationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(fermentationNameLabel)
        
        fermentationNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 125).isActive = true
        fermentationNameLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
//        fermentationNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        fermentationNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
