import Foundation
import UIKit

class BottomSheetDatePicker: UIView {
    
    var datePicker = UIDatePicker()
    var nextButton = UIButton()
    
    override init(frame: CGRect) {
      super.init(frame: frame)

        datePicker.setDate(Date.init(), animated: false)
        datePicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        datePicker.datePickerMode = .time
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(datePicker)
        self.addSubview(nextButton)
        
        nextButton.backgroundColor = .clear
        nextButton.layer.shadowOpacity = 0.2
        nextButton.layer.cornerRadius = 15
        nextButton.setTitle("Done", for: .normal)
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        nextButton.layer.shadowRadius = 5
        nextButton.setTitleColor(UIColor.init(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.9949683547, green: 0.7712727189, blue: 0, alpha: 1)
        nextButton.addTarget(self, action: #selector(animateButton), for: .touchDown)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true
        nextButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        nextButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true
        datePicker.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 5.0)
    }
    
    @objc func animateButton() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        self.nextButton.layer.add(pulse, forKey: nil)
     
     }
}
