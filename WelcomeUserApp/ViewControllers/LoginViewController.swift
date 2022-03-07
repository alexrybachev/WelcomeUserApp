//
//  LoginViewController.swift
//  WelcomeUserApp
//
//  Created by Aleksandr Rybachev on 07.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private let userName = "User"
    private let password = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
        print(welcomeVC)
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func showUserName() {
    }
    
    @IBAction func showPassword() {
    }
    
}

