//
//  WelcomeViewController.swift
//  WelcomeUserApp
//
//  Created by Aleksandr Rybachev on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setColor()
        welcomeLabel.text = "Welcome, \(userName ?? "")! 😜"
    }
    
    private func setColor() {
        
        let primaryColor = UIColor(
            red: 153 / 255,
            green: 26 / 255,
            blue: 61 / 255,
            alpha: 1
        ).cgColor
        
        let secondaryColor = UIColor(
            red: 243 / 255,
            green: 255 / 255,
            blue: 51 / 255,
            alpha: 1
        ).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [primaryColor, secondaryColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
