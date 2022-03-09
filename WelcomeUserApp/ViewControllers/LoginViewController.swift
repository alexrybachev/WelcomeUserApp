//
//  LoginViewController.swift
//  WelcomeUserApp
//
//  Created by Aleksandr Rybachev on 07.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    // MARK: - Private Properties
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if userNameTF.text != userName || passwordTF.text != password {
            alertController(
                title: "Invalid login or password!",
                message: "Please, enter correct login and password!"
            )
            return
        }
        
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func showUserOrPassword(_ sender: UIButton) {
        sender.tag == 0
        ? alertController(title: "Oops!", message: "Your name is \(userName) 🙂")
        : alertController(title: "Oops!", message: "Your password is \(password) 🙂")
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

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            performSegue(withIdentifier: "showWelcomePage", sender: nil)
        }
        return true
    }
}

// MARK: - Gradient Color
extension LoginViewController {
    private func setColor() {
        view.backgroundColor = UIColor.clear
        
        let primaryColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1).cgColor
        let secondaryColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [primaryColor, secondaryColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
