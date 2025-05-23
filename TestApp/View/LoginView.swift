//
//  LoginView.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import UIKit

class LoginView: UIViewController {

    let mainImageView = UIImageView()
    let usernameTextFieldContainer = UIView()
    let passwordTextFieldContainer = UIView()
    let usernameImageView = UIImageView()
    let passwordImageView = UIImageView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Setup UI

extension LoginView {
    func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9647058824, alpha: 1)
        setupMainImageView()
        setupUsernameTextFieldContainer()
        setupPasswordTextFieldContainer()
        setupUsernameImageView()
        setupPasswordImageView()
        setupUsernameTextField()
        setupPasswordTextField()
        setupLoginButton()
    }
    
    func setupMainImageView() {
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.backgroundColor = .clear
        mainImageView.image = UIImage(named: "loginMainImage")
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainImageView)
    }
    
    func setupUsernameTextFieldContainer() {
        usernameTextFieldContainer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        usernameTextFieldContainer.layer.cornerRadius = 25
        usernameTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextFieldContainer)
    }
    
    func setupPasswordTextFieldContainer() {
        passwordTextFieldContainer.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        passwordTextFieldContainer.layer.cornerRadius = 25
        passwordTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextFieldContainer)
    }
    
    func setupUsernameImageView() {
        usernameImageView.contentMode = .scaleAspectFit
        usernameImageView.backgroundColor = .clear
        usernameImageView.image = UIImage(named: "loginImage")
        usernameImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFieldContainer.addSubview(usernameImageView)
    }
    
    func setupPasswordImageView() {
        passwordImageView.contentMode = .scaleAspectFit
        passwordImageView.backgroundColor = .clear
        passwordImageView.image = UIImage(named: "passwordImage")
        passwordImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFieldContainer.addSubview(passwordImageView)
    }
    
    func setupUsernameTextField() {
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 15)!
        ])
        usernameTextField.font = UIFont(name: "Poppins Regular", size: 15)
        usernameTextField.backgroundColor = .clear
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextFieldContainer.addSubview(usernameTextField)
    }
    
    func setupPasswordTextField() {
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 15)!
        ])
        passwordTextField.font = UIFont(name: "Poppins Regular", size: 15)
        passwordTextField.backgroundColor = .clear
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldContainer.addSubview(passwordTextField)
    }
    
    func setupLoginButton() {
        loginButton.titleLabel?.attributedText = NSAttributedString(string: "Login", attributes: [
            .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 15)!
        ])
        loginButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        loginButton.layer.cornerRadius = 40
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
    }
}

//MARK: Setup Constraints

extension LoginView {
    func setupConstraints() {
        setupMainImageConstraints()
        setupUsernameTextFieldContainerConstraints()
        setupUsernameImageViewConstraints()
        setupUsernameTextFieldConstraints()
    }
    
    func setupMainImageConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 287),
            mainImageView.widthAnchor.constraint(equalToConstant: 287),
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setupUsernameTextFieldContainerConstraints() {
        NSLayoutConstraint.activate([
            usernameTextFieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            usernameTextFieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            usernameTextFieldContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -16),
            usernameTextFieldContainer.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    func setupUsernameImageViewConstraints() {
        NSLayoutConstraint.activate([
            usernameImageView.heightAnchor.constraint(equalToConstant: 32),
            usernameImageView.widthAnchor.constraint(equalToConstant: 32),
            usernameImageView.leadingAnchor.constraint(equalTo: usernameTextFieldContainer.leadingAnchor, constant: 10)
        ])
    }
    
    func setupUsernameTextFieldConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: usernameImageView.trailingAnchor, constant: 8),
            usernameTextField.trailingAnchor.constraint(equalTo: usernameTextFieldContainer.trailingAnchor, constant: -16),
            usernameTextField.centerYAnchor.constraint(equalTo: usernameTextFieldContainer.centerYAnchor)
        ])
    }
    
    func setupPasswordTextFieldContainerConstraints() {
        NSLayoutConstraint.activate([
            passwordTextFieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTextFieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTextFieldContainer.heightAnchor.constraint(equalToConstant: 55),
            passwordTextFieldContainer.topAnchor.constraint(equalTo: usernameTextFieldContainer.bottomAnchor, constant: 16)
        ])
    }
    
    func setupPasswordImageViewConstraints() {
        NSLayoutConstraint.activate([
            passwordImageView.heightAnchor.constraint(equalToConstant: 32),
            passwordImageView.widthAnchor.constraint(equalToConstant: 32),
            passwordImageView.leadingAnchor.constraint(equalTo: passwordTextFieldContainer.leadingAnchor, constant: 10)
        ])
    }
    
    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: passwordImageView.trailingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldContainer.trailingAnchor, constant: -16),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordTextFieldContainer.centerYAnchor)
        ])
    }
    
    func setupLoginButtonConstraints() {
        NSLayoutConstraint.activate([
            passwordTextFieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTextFieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTextFieldContainer.heightAnchor.constraint(equalToConstant: 55),
            passwordTextFieldContainer.topAnchor.constraint(equalTo: passwordTextFieldContainer.bottomAnchor, constant: 16)
        ])
    }
}
