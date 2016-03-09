//
//  ViewController.swift
//  Autolayout
//
//  Created by Ma Levi on 2/18/16.
//  Copyright © 2016 Levi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    var secure = false { didSet { updateUI() } }
    
    private func updateUI()
    {
        passwordField.secureTextEntry = secure
        passwordLabel.text = secure ? "Secure Password" : "Password"
    }
    
    @IBAction func toggleSecurity()
    {
        secure = !secure
    }
    
}

