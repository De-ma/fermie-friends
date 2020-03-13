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
        self.navigationController?.navigationBar.topItem?.title = "Creating A Friend"
        
        let friendLabel: UILabel = {
            let label = UILabel()
            label.text = "Name: "
            label.font = label.font.withSize(21)
            label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            return label
        }()
        
        friendName = {
            let textField = UITextField()
            textField.placeholder = "Choose this wisely.."
            textField.autocorrectionType = .no
            textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            textField.addLine(position: .LINE_POSITION_BOTTOM, color: .black, width: 1)
            return textField
        }()
        
        let typeLabel: UILabel = {
            let label = UILabel()
            label.text = "Fermentation Type: "
            label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            label.font = label.font.withSize(21)
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
            label.font = label.font.withSize(21)
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
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.alignment = .top
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 20
        
        
        let friendLabelNameStackView = UIStackView()
        friendLabelNameStackView.addArrangedSubview(friendLabel)
        friendLabelNameStackView.addArrangedSubview(friendName)
        friendLabelNameStackView.axis = .horizontal
        friendLabelNameStackView.spacing = 10

        mainStackView.addArrangedSubview(friendLabelNameStackView)
        mainStackView.addArrangedSubview(typeLabel)
        mainStackView.addArrangedSubview(friendType)
        mainStackView.addArrangedSubview(dateLabel)
        mainStackView.addArrangedSubview(datePicker)
        view.addSubview(mainStackView)
        view.addSubview(addFriendButton)
        
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
         mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
         mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true

        friendName.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2).isActive = true
        friendName.heightAnchor.constraint(equalTo: friendLabel.heightAnchor).isActive = true
        friendType.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        friendType.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        datePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        
        addFriendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        addFriendButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        addFriendButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20 ).isActive = true
        addFriendButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addFriendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isFirstResponder {
            textField
        }
    }
    
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

enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UIView {
    func addLine(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}
