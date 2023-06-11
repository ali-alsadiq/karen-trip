//
//  SignUpViewController.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-06-10.
//

import UIKit

class SignUpViewController: UIViewController {
    var passwordField: CustomTextField!
    var emailField: CustomTextField!
    var userNameField: CustomTextField!

    
    @IBOutlet weak var signUpBttn: CTAButton!
    
    @IBAction func singupBttnTapped(_ sender: CTAButton) {
        print("Signup")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = BackButton(text: nil, target: self, action: #selector(goBack))
        let navigationBar = CustomNavigationBar(title: "Sign Up")
        
        navigationBar.items?.first?.leftBarButtonItem = backButton
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(navigationBar)
            
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // User name text field
        userNameField = CustomTextField(placeholder: "User Name", textContentType: .username)
        
        // Email text field
        emailField = CustomTextField(placeholder: "Email", textContentType: .emailAddress)

        // Password text field
        passwordField = CustomTextField(placeholder: "Password", textContentType: .password)
        passwordField.isSecureTextEntry = true
        
        
        // Create a VStack and add the text fields
        let loginStack = UIStackView(arrangedSubviews: [
            userNameField,
            emailField,
            passwordField
        ])
        
        loginStack.axis = .vertical
        loginStack.spacing = 21

        // Add the stack view to the view
        view.addSubview(loginStack)
        
        // Add constraints for the stack view
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 407)
        ])
        
        // Resize Login Button
        signUpBttn.frame = CGRect(x: 37, y: 690, width: 355, height: 55)
        
    }
    
    @objc func goBack() {
        // Pop the current view controller from the navigation stack
        dismiss(animated: true, completion: nil)
    }
    
}
