//
//  EmptyFriendsListView.swift
//  Fremie Friends
//
//  Created by Adam Abu Adas on 2020-12-08.
//  Copyright © 2020 Dema Abu Adas. All rights reserved.
//

import Foundation
import UIKit

class EmptyFriendsListView: UIView {

    var didSetupConstraints = false
    let label = UILabel()
    let addButton = UIButton()
    var image = UIImage(named: "sadJar")!
    
    private var imageView: UIImageView!
    private let topFont = UIFont.boldSystemFont(ofSize: 22)

    private let imageViewHeight: CGFloat = 100
    private let imageViewWidth: CGFloat = 300

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    init(image: UIImage, top: String, bottom: String) {
        super.init(frame: CGRect.zero)
        setupViews()

    }

    func setupViews() {
        
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        label.text = "No Fermentation Friends Added!"
        label.shadowColor = UIColor.black
        label.shadowOffset = CGSize(width: 0, height: 0.2)
        label.font = topFont
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addButton.backgroundColor = .clear
        addButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addButton.layer.borderWidth = 2
        addButton.layer.cornerRadius = 15
        addButton.setTitle("New Fermintation Friend", for: .normal)
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        addButton.layer.shadowRadius = 5
        addButton.setTitleColor(UIColor.init(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        addButton.backgroundColor = #colorLiteral(red: 0.9949683547, green: 0.7712727189, blue: 0, alpha: 1)
        addButton.titleLabel?.font = topFont

        addButton.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(addButton)
        self.addSubview(label)
        self.addSubview(imageView)
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {

            label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            label.center.x = self.center.x
            
            imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (UIScreen.main.bounds.width / 2) - 75).isActive = true
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 300).isActive = true
            
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
            addButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
            
            didSetupConstraints = true
        }

        super.updateConstraints()
    }
}
