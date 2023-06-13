//
//  ViewController.swift
//  KarenTrip
//
//  Created by Ali Alsadiq on 2023-05-06.
//

import UIKit
class WelcomViewController: UIViewController {
    
    @IBOutlet weak var loginBttn: CTAButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginBttn.frame = CGRect(x: 39, y: 683, width: 335, height: 55)

    }
}
