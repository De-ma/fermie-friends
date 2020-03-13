import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.navigationController?.isNavigationBarHidden = true

        let startBtn: UIButton = {
            let button = UIButton()
            button.setTitle("New Fermie Friend!", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.addTarget(self, action: #selector(newFriend), for: .touchDown)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        let bacteria: UIImageView = {
            let bundlePath = Bundle.main.path(forResource: "bacteria", ofType: "png")
            let imgView = UIImageView(image: UIImage(contentsOfFile: bundlePath!))
            imgView.translatesAutoresizingMaskIntoConstraints = false
            return imgView
        }()
        

        view.addSubview(bacteria)
        view.addSubview(startBtn)

        bacteria.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bacteria.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        // I dont want it to be equal to the top anchor, I want it a certain distance from the top anchor
        // so uhhh what can I do ?!?!
//        bacteria.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        bacteria.widthAnchor.constraint(equalToConstant: 300).isActive = true
        bacteria.heightAnchor.constraint(equalToConstant: 296).isActive = true
        
        startBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startBtn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

    @objc func newFriend() {
        print("huh")
//        let addNewFriends = NewFriendView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        self.view.addSubview(addNewFriends)
         self.navigationController?.pushViewController(NewFriendViewController(), animated: true)
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

