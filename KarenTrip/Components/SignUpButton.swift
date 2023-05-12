//
//  SignUpButton.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-05-12.
//

import UIKit

class SignUpButton: UIButton {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupProperties()
    }
    
    // MARK: - Private Methods
    
    private func setupProperties() {
        // Set button properties
        self.frame = CGRect(x: 39, y: 755, width: 335, height: 55)
        self.backgroundColor = .white
        self.layer.cornerRadius = 29
        
        // Add shadow to button
        self.layer.shadowColor = UIColor(red: 112/255, green: 144/255, blue: 176/255, alpha: 0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 16)
        self.layer.shadowRadius = 40
        self.layer.shadowOpacity = 1.0
    }
}
