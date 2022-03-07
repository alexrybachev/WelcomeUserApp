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
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func logInButton() {
        if userNameTF.text != userName && passwordTF.text != password {
            alertController(title: "Invalid login or password!", message: "Please, enter correct login and password!")
        }
    }
    
    @IBAction func showUserName() {
        alertController(title: "Oops!", message: "Your name is User 🙂")
    }
    
    @IBAction func showPassword() {
        alertController(title: "Oops!", message: "Your password is Password 🙂")
    }
}

// MARK: - AlertController
extension LoginViewController {
    private func alertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = nil
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

