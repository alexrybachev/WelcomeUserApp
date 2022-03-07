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
        welcomeLabel.text = "Welcome, \(userName ?? "")! 😜"
    }
}
