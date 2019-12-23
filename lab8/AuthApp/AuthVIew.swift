//
//  VIew.swift
//  lab8
//
//  Created by Dmitry Kim on 19.12.2019.
//  Copyright © 2019 Dmitry Kim. All rights reserved.
//

import UIKit

@objc
protocol AuthViewDelegate: NSObjectProtocol {
    
    func backToLoginView()
    
    func checkCode(_ code: String)
        
}

class AuthView: UIView {
    
    @IBOutlet weak var firstDigit: UITextField!
    @IBOutlet weak var secondDigit: UITextField!
    @IBOutlet weak var thirdDigit: UITextField!
    @IBOutlet weak var fouthDigit: UITextField!
    @IBOutlet weak var fifthDigit: UITextField!

    @IBOutlet var verificateButton: UIButton!
    
    @IBOutlet var delegate: AuthViewDelegate?
    
    var code = ""
    
    func validateCode() -> Bool{
        var valid = false
        
        if firstDigit.text?.count == 1 &&
            secondDigit.text?.count == 1 &&
            thirdDigit.text?.count == 1 &&
            fouthDigit.text?.count == 1 &&
            fifthDigit.text?.count == 1 {
            
            code = String("\(firstDigit.text!)\(secondDigit.text!)\(thirdDigit.text!)\(fouthDigit.text!)\(fifthDigit.text!)")
            
            print(code)
            valid = true
        }
        
        
        return valid
    }
    
    @IBAction func varificateAction(_ sender: UIButton) {
        if validateCode() {
            
            delegate?.checkCode(code)
            
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        
        delegate?.backToLoginView()
    }
    
}
