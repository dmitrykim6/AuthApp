//
//  LoginView.swift
//  lab8
//
//  Created by Dmitry Kim on 19.12.2019.
//  Copyright © 2019 Dmitry Kim. All rights reserved.
//

import UIKit

@objc
protocol LoginViewDelegate: NSObjectProtocol {
    
    func loginView(
        _ view: LoginView,
        didGetUsername usernameField: String,
        password: String
    )
    
    @objc optional
    func loginView(
        _ view: LoginView,
        validateUsername username: String
    ) -> Bool
    
    @objc optional
    func loginView(
        _ view: LoginView,
        validatePassword password: String
    ) -> Bool
}

class LoginView: UIView {
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var delegate: LoginViewDelegate?
    
    var username: String = "" {
        didSet {
            self.validateInput()
        }
    }
    
    var password: String = "" {
        didSet {
            self.validateInput()
        }
    }
    
    func clearData() {
        self.usernameField.text = ""
        self.passwordField.text = ""
        self.username = ""
        self.password = ""
    }
    
    @discardableResult
    func validateInput() -> Bool {
        let valid =
            self.validateUsername() && self.validatePassword()
        
        self.loginButton.isEnabled = valid
        
        return valid
    }
    
    func validateUsername() -> Bool {
        let valid =
            self.delegate?.loginView?(
                self,
                validateUsername: self.username
                ) ?? (self.username.count >= 4)
        
        return valid
    }
    
    func validatePassword() -> Bool {
        
        let valid =
            self.delegate?.loginView?(
                self,
                validatePassword: self.password
                ) ?? (self.password.count >= 4)
        
        return valid
    }
    
    @IBAction func usernameFieldChanged(_ sender: UITextField) {
        self.username = self.usernameField.text ?? ""
    }
    
    @IBAction func passwordFieldChanged(_ sender: UITextField) {
        self.password = passwordField.text ?? ""
    }
    
    @IBAction func checkLoginData(_ sender: UIButton) {
        
        if self.validateInput() {
            self.delegate?.loginView(
                self,
                didGetUsername: self.username,
                password: self.password
            )
        }
        
    }
    
}
