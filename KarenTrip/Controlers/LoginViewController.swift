//
//  LoginViewController.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-06-05.
//

import UIKit

class LoginViewController: UIViewController {
    var isBadLoginAttempt = false
    var passwordField: CustomTextField! // Declare passwordField as a property
    var emailField: CustomTextField!
    var forgotPasswordButton = UIButton(type: .system)
    var wrongPasswordLabel: UILabel!

    
    @IBOutlet weak var loginBttn: CTAButton!
    
    @IBAction func loginBttnTapped(_ sender: CTAButton) {
        isBadLoginAttempt = !isBadLoginAttempt
        updatePasswordFieldUI()
        
        // Make next click inside the field seems like a new click
        passwordField.isEnabled = false
        emailField.isEnabled = false
        passwordField.isEnabled = true
        emailField.isEnabled = true
    }
    
    @IBOutlet weak var signupBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = BackButton(text: nil, target: self, action: #selector(goBack))
        let navigationBar = CustomNavigationBar(title: "Log in")
        
        navigationBar.items?.first?.leftBarButtonItem = backButton
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(navigationBar)
            
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Email text field
        emailField = CustomTextField(placeholder: "Email", textContentType: .emailAddress)

        // Password text field
        passwordField = CustomTextField(placeholder: "Password", textContentType: .password)
        passwordField.isSecureTextEntry = true
        
        // Check the state and apply red border to password field if needed
        if isBadLoginAttempt {
            passwordField.layer.borderWidth = 1
            passwordField.layer.borderColor = UIColor.red.cgColor
        }
        
        // Create a VStack and add the text fields
        let loginStack = UIStackView(arrangedSubviews: [
            emailField,
            passwordField
        ])
        
        loginStack.axis = .vertical
        loginStack.spacing = 17

        // Add the stack view to the view
        view.addSubview(loginStack)
        
        // Add constraints for the stack view
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 397)
        ])
        
        // Add target action to password field for editingDidBegin event
        passwordField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        emailField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)

        
        // Forgot password button
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 17,weight: .bold)
        forgotPasswordButton.setTitleColor(UIColor(red: 148/255, green:148/255, blue: 148/255, alpha: 1), for: .normal)
        forgotPasswordButton.addTarget(self, action:#selector(forgotPasswordButtonTapped), for: .touchUpInside)
            
        
        view.addSubview(forgotPasswordButton)
        
    
        // Add constraints for forgot password button
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -59),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 217),
            forgotPasswordButton.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 12)
        ])
        
        // Forgot password label
        wrongPasswordLabel = UILabel()
        wrongPasswordLabel.text = "Wrong Password, please try again"
        wrongPasswordLabel.textColor = .red
        wrongPasswordLabel.font = UIFont.systemFont(ofSize: 12, weight:.heavy)
        wrongPasswordLabel.isHidden = true
        
        view.addSubview(wrongPasswordLabel)
        
        // Add constraints for forgot password button
        wrongPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wrongPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150),
            wrongPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            wrongPasswordLabel.topAnchor.constraint(equalTo: loginStack.bottomAnchor, constant: 8)
        ])
        
        
        // Resize Login Button
        loginBttn.frame = CGRect(x: 37, y: 577, width: 355, height: 55)
        
        //Signup Button
        signupBttn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)


    }
    
    @objc func goBack() {
        // Pop the current view controller from the navigation stack
        dismiss(animated: true, completion: nil)
    }
    
    // Action method for the button tap
    @objc func forgotPasswordButtonTapped() {
        print("Forgot password")
    }
    
    @objc func textFieldEditingDidBegin() {
        // Remove bad login message when the user attempts to edit
        isBadLoginAttempt = false
        updatePasswordFieldUI()
    }
    
    private func updatePasswordFieldUI() {
        if isBadLoginAttempt {
            passwordField.layer.borderWidth = 1
            passwordField.layer.borderColor = UIColor.red.cgColor
            wrongPasswordLabel.isHidden = false
            forgotPasswordButton.isHidden = true
        } else {
            passwordField.layer.borderWidth = 0
            wrongPasswordLabel.isHidden = true
            forgotPasswordButton.isHidden = false
        }
    }
}
