import Foundation
import UIKit

class NewFriendViewController: UIViewController {
    
    var newFriendViewModel = NewFriendViewModel()
    var newFriendSuccessModal = NewFriendSuccessModal()
    
    var completionHandler:((LocalFriend) -> String)?
    
    var mainStackView = UIStackView()
    var typeStackView = UIStackView()
    var reminderStackView = UIStackView()
    
    let typeLabel = UILabel()
    let reminderLabel = UILabel()

    var friendName = FFTextField()
    var picker = BottomSheetPicker()
    var datePicker = BottomSheetDatePicker()

    var friendName2 = ""
    var selectedRow = "Kombucha"
    var typeLabelText = "What kind of fermentation is "
    var reminderLabelText = "When should we remind you to feed "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newFriendSuccessModal)
//        buildViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        animate()
    }

    func buildViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let friendLabel: UILabel = {
            let label = UILabel()
            label.text = "What’s Your New Fermie Friend’s Name?"
            label.font = label.font.withSize(21)
            label.textColor = #colorLiteral(red: 0.4549019608, green: 0.3254901961, blue: 0.007843137255, alpha: 1)
            return label
        }()
    
        friendName = {
            let textField = FFTextField()
            textField.placeholder = "Choose this wisely.."
            textField.autocorrectionType = .no
            textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            textField.layer.borderWidth = 2
            textField.textAlignment = .center
            textField.layer.masksToBounds = true
            textField.layer.cornerRadius = 5
            textField.delegate = self
            textField.keyboardType = UIKeyboardType.alphabet
            return textField
        }()

        typeLabel.text = typeLabelText
        typeLabel.font = typeLabel.font.withSize(21)
        typeLabel.textColor = #colorLiteral(red: 0.4549019608, green: 0.3254901961, blue: 0.007843137255, alpha: 1)
        
        reminderLabel.text = "When should we remind you to feed unnamed"
        reminderLabel.numberOfLines = 2
        reminderLabel.font = reminderLabel.font.withSize(21)
        reminderLabel.textColor = #colorLiteral(red: 0.4549019608, green: 0.3254901961, blue: 0.007843137255, alpha: 1)

        mainStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.alignment = .top
            stackView.distribution = .equalSpacing
            stackView.spacing = 20
            stackView.addArrangedSubview(friendLabel)
            stackView.addArrangedSubview(friendName)
            stackView.tag = 0
            return stackView
        }()
        
        typeStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.alignment = .top
            stackView.distribution = .equalSpacing
            stackView.addArrangedSubview(typeLabel)
//            stackView.addArrangedSubview(friendType)
            stackView.tag = 1
            return stackView
        }()
        
        reminderStackView = {
                    let stackView = UIStackView()
                    stackView.axis = .vertical
                    stackView.translatesAutoresizingMaskIntoConstraints = false
                    stackView.alignment = .top
                    stackView.distribution = .equalSpacing
                    stackView.addArrangedSubview(reminderLabel)
                    stackView.tag = 2
                    return stackView
    }()
            
        picker.pickerView.delegate = self
        picker.pickerView.dataSource = self
        
        buildNameView()
    }
    
    @objc func createNewFriend() {
        //name, type, birthday!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
//        let selectedDate = dateFormatter.string(from: datePicker.date)
//        print(selectedDate)
        print(friendName.text ?? "No name :(")
        print(selectedRow)
//        let friend = localFriend(localName: friendName.text ?? "No name :(", localBirthday: selectedDate, localType: selectedRow)
    }
    
    @objc func nextPushed() {
        self.typeStackView.removeFromSuperview()
        self.typeStackView.isHidden = true
        self.picker.removeFromSuperview()
        self.buildDatePickerView()
    }
    
    
    @objc func donePushed() {
        self.typeStackView.removeFromSuperview()
        self.typeStackView.isHidden = true
        self.picker.removeFromSuperview()
        self.buildDatePickerView()
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
             self.mainStackView.transform = CGAffineTransform(translationX: self.mainStackView.bounds.origin.x - 500, y: self.mainStackView.bounds.origin.y)}, completion: nil)
    }
    
    private func nextView() {
        if !mainStackView.isHidden {
                
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.mainStackView.transform = CGAffineTransform(translationX: self.mainStackView.bounds.origin.x - 1000, y: self.mainStackView.bounds.origin.y)
            }, completion: { _ in
                self.mainStackView.removeFromSuperview()
                self.mainStackView.isHidden = true
                self.buildPickerView()
            })
        }
    }
    
    private func nextDatePickerView() {
        if !typeStackView.isHidden {
                
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.mainStackView.transform = CGAffineTransform(translationX: self.mainStackView.bounds.origin.x - 1000, y: self.mainStackView.bounds.origin.y)
            }, completion: { _ in
                self.typeStackView.removeFromSuperview()
                self.typeStackView.isHidden = true
                self.buildDatePickerView()
            })
        }
    }
    
    private func buildNameView() {
        view.addSubview(mainStackView)

        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
//        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 100).isActive = true
    }
    
    private func buildPickerView() {
        self.view.addSubview(self.typeStackView)
        self.view.addSubview(self.picker)
        
        self.picker.nextButton.addTarget(self, action: #selector(nextPushed), for: .touchDown)
        
        self.picker.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 200).isActive = true
        self.picker.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        self.picker.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.5).isActive = true
                        
        self.typeStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.typeStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 100).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
              self.picker.transform = CGAffineTransform(translationX: self.picker.bounds.origin.x, y: self.picker.bounds.origin.y - 200)}, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
             self.typeStackView.transform = CGAffineTransform(translationX: self.typeStackView.bounds.origin.x - 500, y: self.typeStackView.bounds.origin.y)}, completion: nil)
    }
    
    private func buildDatePickerView() {
        self.view.addSubview(self.reminderStackView)
        self.view.addSubview(self.datePicker)
        
        self.datePicker.nextButton.addTarget(self, action: #selector(donePushed), for: .touchDown)
        
        self.datePicker.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 200).isActive = true
        self.datePicker.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
        self.datePicker.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.5).isActive = true
        
                        
        self.reminderStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.reminderStackView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 100).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
              self.datePicker.transform = CGAffineTransform(translationX: self.datePicker.bounds.origin.x, y: self.datePicker.bounds.origin.y - 200)}, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
             self.reminderStackView.transform = CGAffineTransform(translationX: self.reminderStackView.bounds.origin.x - 500, y: self.reminderStackView.bounds.origin.y)}, completion: nil)
    }
}

extension NewFriendViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("another trigger")
        friendName2 = textField.text ?? "Unnamed"
        typeLabelText = "What kind of fermentation is \(friendName2)"
        reminderLabelText = "When should we remind you to feed \(friendName2)"
        textField.resignFirstResponder()
        nextView()
        return true
    }
}

extension NewFriendViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return newFriendViewModel.friendOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = newFriendViewModel.friendOptions[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = newFriendViewModel.friendOptions[row]
        nextView()
    }
}

//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}
