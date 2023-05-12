//
//  ViewController.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-05-06.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Wait for 1.5 seconds before moving to the WelcomeViewController
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let welcomeVC = storyboard.instantiateViewController(withIdentifier: "WelcomViewController")
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: true, completion: nil)
        }
    }
}
