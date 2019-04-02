//
//  LoginViewController.swift
//  JokesAPI
//
//  Created by Jeremiah Hawks on 4/2/19.
//  Copyright © 2019 Jeremiah Hawks. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        // save the password in keychain
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        let passwordItem = KeychainPasswordItem(service: "JokesAPI", account: username)
        try? passwordItem.savePassword(password)
        print(try? passwordItem.readPassword())
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.isEnabled = false
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func checkUsernameAndPassword() -> Bool {
        return usernameTextField.text?.isEmpty == false && usernameTextField.text != nil && passwordTextField.text?.isEmpty == false && passwordTextField.text != nil
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        loginButton.isEnabled = checkUsernameAndPassword()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if loginButton.isEnabled {
            loginButtonClicked(self)            
        }
        return true
    }
}

