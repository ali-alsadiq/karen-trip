//
//  SocialLoginButton.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-06-09.
//

import UIKit

class SocialLoginButton: UIButton {
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // MARK: - Private Methods
    
    private func setupButton() {
        // Set button properties
        self.backgroundColor = .white
        self.layer.cornerRadius = 26
        
        // Add icon image view
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        self.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
       
        // Add text label
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        self.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalToConstant: 162).isActive = true
        self.heightAnchor.constraint(equalToConstant: 55).isActive = true

        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)

        ])
        
        // Customize Facebook button
        if self.tag == 1 {
            iconImageView.image = UIImage(named: "facebook_icon") // Replace "facebook_icon" with your actual image name
            textLabel.text = "Facebook"
            self.backgroundColor = UIColor(red: 66/255, green: 103/255, blue: 178/255, alpha: 1.0)
            textLabel.textColor = .white
            NSLayoutConstraint.activate([
                textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
                textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            ])
        }
        // Customize Twitter button
        else if self.tag == 2 {
            iconImageView.image = UIImage(named: "twitter_icon") // Replace "twitter_icon" with your actual image name
            textLabel.text = "Twitter"
            self.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1.0)
            textLabel.textColor = .white
            NSLayoutConstraint.activate([
                textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
                textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
            ])
        }
    }
}
