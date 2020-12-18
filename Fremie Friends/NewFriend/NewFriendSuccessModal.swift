import Foundation
import UIKit

class NewFriendSuccessModal: UIView {
    
    var hasUpdatedConstraints = false
    
    var image = UIImage(named: "checkmark")!
    var imageView: UIImageView!
    
    var dismissButton = UIButton()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    
    private let imageViewHeight: CGFloat = 60
    private let imageViewWidth: CGFloat = 60

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let frame = CGRect(x: (UIScreen.main.bounds.width * 0.5) - 150, y: (UIScreen.main.bounds.height * 0.5) - 150, width: 300, height: 235)
        super.init(frame: CGRect.zero)
        self.frame = frame
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 2, height: 3)
        self.layer.shadowOpacity = 0.4
        buildView()
    }
    
    func buildView() {
        
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: frame.midX - imageViewHeight - 30, y: -30, width: imageViewWidth, height: imageViewHeight)

        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.midX - 60, y: 0), radius: CGFloat(40), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        //change the fill color
        shapeLayer.fillColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        //you can change the stroke color
//        shapeLayer.strokeColor = UIColor.red.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0

        self.layer.addSublayer(shapeLayer)

        
        titleLabel.text = "Awesome!"
        titleLabel.numberOfLines = 1
        titleLabel.center.x = self.center.x
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(30)
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: frame.midX - titleLabel.frame.width, y: 60, width: titleLabel.frame.width, height: titleLabel.frame.height)

        descriptionLabel.center.x = self.center.x
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 1
        descriptionLabel.text = "New fermie friend added"
        descriptionLabel.font = descriptionLabel.font.withSize(21)
        descriptionLabel.sizeToFit()
        descriptionLabel.frame = CGRect(x: frame.midX - (descriptionLabel.frame.width * 0.75), y: 120, width: descriptionLabel.frame.width, height: descriptionLabel.frame.height)
        
        dismissButton.frame = CGRect(x: 22, y: 180, width: 250, height: 38)
        dismissButton.layer.cornerRadius = 20
        dismissButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        dismissButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        dismissButton.layer.shadowRadius = 4
        dismissButton.layer.shadowOffset = CGSize(width: 2, height: 1)
        dismissButton.layer.shadowOpacity = 0.5
        dismissButton.titleLabel?.textAlignment = .center
        dismissButton.titleLabel?.center = dismissButton.center
        dismissButton.backgroundColor = #colorLiteral(red: 0.2196078431, green: 0.7137254902, blue: 0.2392156863, alpha: 1)
        dismissButton.setTitle("Dismiss", for: .normal)
//        dismissButton.addTarget(self, action: #selector(animateButton), for: .touchDown)

        
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(dismissButton)
    }
    
}
