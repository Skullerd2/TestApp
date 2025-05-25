//
//  LoginViewModel.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import Foundation

class LoginViewModel{
    
    let keychainManager = KeychainManager.shared
    let defaults = UserDefaults.standard
    func authorizeToAccount(login: String, password: String) -> Bool{
        let savedLogin = KeychainManager.shared.load(key: "login")
        let savedPassword = KeychainManager.shared.load(key: "password")

        return login == savedLogin && password == savedPassword
    }
    
    func setAuthorizedFlag() {
        defaults.set(true, forKey: "isAuth")
    }
    
}
