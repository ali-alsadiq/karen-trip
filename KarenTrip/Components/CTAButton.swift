//
//  SignUpButton.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-05-12.
//

import UIKit

class CTAButton: UIButton {
    
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
        self.backgroundColor = UIColor(red: 88/255, green: 207/255, blue: 194/255, alpha: 1.0)
        self.layer.cornerRadius = 29
        
        // Add shadow to button
        self.layer.shadowColor = UIColor(red: 88/255, green: 207/255, blue: 194/255, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 1.0
    }
    
    // MARK: - Overridden Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Do any additional setup after loading the CTAButton.

        self.titleLabel?.textColor = .white
    }
}
