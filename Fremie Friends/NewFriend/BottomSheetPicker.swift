import Foundation
import UIKit

class BottomSheetPicker: UIView {
    
    var pickerView = UIPickerView()
    var nextButton = UIButton()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
//        self.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.7514140365, blue: 0.6431372762, alpha: 1)
//        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        self.layer.borderWidth = 2.5
//        self.layer.cornerRadius = 15
        
        self.addSubview(pickerView)
        self.addSubview(nextButton)
        
        nextButton.backgroundColor = .clear
        nextButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.layer.borderWidth = 2
        nextButton.layer.cornerRadius = 15
        nextButton.setTitle("Next", for: .normal)
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        nextButton.layer.shadowRadius = 5
        nextButton.setTitleColor(UIColor.init(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.9949683547, green: 0.7712727189, blue: 0, alpha: 1)
        nextButton.addTarget(self, action: #selector(animateButton), for: .touchDown)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
//        nextButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true
        nextButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        nextButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
//        nextButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true
        pickerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 5.0)
    }
    
    @objc func animateButton() {

     nextButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

     UIView.animate(withDuration: 2.0,
                                delay: 0,
                                usingSpringWithDamping: CGFloat(0.20),
                                initialSpringVelocity: CGFloat(6.0),
                                options: UIView.AnimationOptions.allowUserInteraction,
                                animations: {
                                    self.nextButton.transform = CGAffineTransform.identity
         },
                                completion: nil)
    }
    
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
