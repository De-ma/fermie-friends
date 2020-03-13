import Foundation
import UIKit

class NewFriendViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let friendOptions = ["Kombucha", "Kimchi", "Kefir", "Sourdough"]
    var friends: [Friend] = []
    
    var friendName = UITextField()
    var friendType = UIPickerView()
    var datePicker = UIDatePicker()
    var selectedRow = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    func buildViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = "Creating a friend"
        
        let friendLabel: UILabel = {
            let label = UILabel()
            label.text = "Name:"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            return label
        }()
        
        friendName = {
            let textField = UITextField()
            textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textField.layer.borderWidth = 1
            
            textField.translatesAutoresizingMaskIntoConstraints = false

            return textField
        }()
        
        let typeLabel: UILabel = {
            let label = UILabel()
            label.text = "Fermentation Type:"
            label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        friendType = {
            let pickerView = UIPickerView()
            pickerView.translatesAutoresizingMaskIntoConstraints = false
            return pickerView
        }()
        
        let dateLabel: UILabel = {
            let label = UILabel()
            label.text = "Birthday:"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        datePicker = {
            let dPicker = UIDatePicker()
            dPicker.setDate(Date.init(), animated: false)
            dPicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            dPicker.datePickerMode = .date
            dPicker.translatesAutoresizingMaskIntoConstraints = false

            return dPicker
        }()
        
        let intervalType = UIPickerView()
        
        let intervalLabel: UILabel = {
            let label = UILabel()
            label.text = "Feeding Interval Label"
            return label
        }()
        
        let intervalTextField: UITextField = {
            let textField = UITextField()
            textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textField.layer.borderWidth = 1
            return textField
        }()
        
        let addFriendButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            button.setTitle("Create Friend!", for: .normal)
            button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 4
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(createNewFriend), for: .touchDown)
            return button
        }()
        
        friendType.dataSource = self
        friendType.delegate = self
        
        view.addSubview(friendLabel)
        view.addSubview(friendName)
        view.addSubview(typeLabel)
        view.addSubview(friendType)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(addFriendButton)
        
        /*
         Would grouping them up into smalled subviews help this process?
         */

        friendLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        friendLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        friendLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        friendLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        friendName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        friendName.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        friendName.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        friendName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        typeLabel.topAnchor.constraint(equalTo: friendLabel.bottomAnchor, constant: 10).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        typeLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        typeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        friendType.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 0).isActive = true
        friendType.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        friendType.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        friendType.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        friendType.heightAnchor.constraint(equalToConstant: 100).isActive = true

        dateLabel.topAnchor.constraint(equalTo: friendType.bottomAnchor, constant: 10).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0).isActive = true
        datePicker.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        datePicker.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        datePicker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addFriendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        addFriendButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        addFriendButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        addFriendButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        addFriendButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func createNewFriend() {
        //name, type, birthday!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        print(friendName.text ?? "No name :(")
        print(selectedRow)
        let friend = Friend(name: friendName.text ?? "No name :(", birthday: selectedDate, type: selectedRow)
        friends.append(friend)

        let alert = UIAlertController(title: "Friend Created!", message: "Yay!!!!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")
                    self.navigationController?.isNavigationBarHidden = true
                    self.navigationController?.popViewController(animated: true)

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")


              @unknown default:
                fatalError()
            }}))
        self.present(alert, animated:  true, completion: nil)

    }
}

extension NewFriendViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return friendOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = friendOptions[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = friendOptions[row]
    }
}
