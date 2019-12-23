//
//  AuthViewController.swift
//  lab8
//
//  Created by Dmitry Kim on 19.12.2019.
//  Copyright © 2019 Dmitry Kim. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var authView: UIView!
    
    let testUsername = "admin"
    let testPassword = "1234"
    
    func loginUser(with username: String, password: String) {
        
        if username == self.testUsername &&
            password == self.testPassword {
            
            self.loginView.isHidden = true
            self.authView?.isHidden = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension AuthViewController: LoginViewDelegate {
    
    func loginView(_ view: LoginView, validateUsername username: String) -> Bool {
        
        return username.count >= 5
    }
    
    func loginView(
        _ view: LoginView,
        didGetUsername username: String,
        password: String
    ) {
        self.loginUser(with: username, password: password)
    }
}
