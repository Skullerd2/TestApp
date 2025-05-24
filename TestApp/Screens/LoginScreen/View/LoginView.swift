//
//  LoginView.swift
//  TestApp
//
//  Created by Vadim on 23.05.2025.
//

import UIKit

class LoginView: UIViewController, UITextFieldDelegate {
    
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupUI()
        setupConstraints()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
        passwordTextFieldContainer.addSubview(passwordImageView)
    }
    
    func setupUsernameTextField() {
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 15)!
        ])
        usernameTextField.font = UIFont(name: "Poppins Regular", size: 15)
        usernameTextField.textColor = .black
        usernameTextField.backgroundColor = .clear
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.tag = 0
        usernameTextFieldContainer.addSubview(usernameTextField)
    }
    
    func setupPasswordTextField() {
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            .foregroundColor: #colorLiteral(red: 0.5764705882, green: 0.5843137255, blue: 0.6431372549, alpha: 1),
            .font: UIFont(name: "Poppins Regular", size: 15)!
        ])
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont(name: "Poppins Regular", size: 15)
        passwordTextField.backgroundColor = .clear
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        passwordTextField.tag = 1
        passwordTextFieldContainer.addSubview(passwordTextField)
    }
    
    func setupLoginButton() {
        let normalTitle = NSAttributedString(string: "Login", attributes: [
            .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            .font: UIFont(name: "Poppins Bold", size: 15)!
        ])
        let onTapTitle = NSAttributedString(string: "Login", attributes: [
            .foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5),
            .font: UIFont(name: "Poppins Bold", size: 15)!
        ])
        loginButton.setAttributedTitle(normalTitle, for: .normal)
        loginButton.setAttributedTitle(onTapTitle, for: .highlighted)
        loginButton.backgroundColor = #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        loginButton.layer.cornerRadius = 27.5
        loginButton.layer.shadowColor = #colorLiteral(red: 0.09803921569, green: 0.1098039216, blue: 0.1960784314, alpha: 1)
        loginButton.layer.shadowOpacity = 0.1
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        loginButton.layer.shadowRadius = 10
        loginButton.layer.masksToBounds = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
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
        setupPasswordTextFieldContainerConstraints()
        setupPasswordImageViewConstraints()
        setupPasswordTextFieldConstraints()
        setupLoginButtonConstraints()
    }
    
    func setupMainImageConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 287),
            mainImageView.widthAnchor.constraint(equalToConstant: 287),
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupUsernameTextFieldContainerConstraints() {
        NSLayoutConstraint.activate([
            usernameTextFieldContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            usernameTextFieldContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            usernameTextFieldContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 71),
            usernameTextFieldContainer.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    func setupUsernameImageViewConstraints() {
        NSLayoutConstraint.activate([
            usernameImageView.heightAnchor.constraint(equalToConstant: 32),
            usernameImageView.widthAnchor.constraint(equalToConstant: 32),
            usernameImageView.leadingAnchor.constraint(equalTo: usernameTextFieldContainer.leadingAnchor, constant: 10),
            usernameImageView.centerYAnchor.constraint(equalTo: usernameTextFieldContainer.centerYAnchor)
        ])
    }
    
    func setupUsernameTextFieldConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.leadingAnchor.constraint(equalTo: usernameImageView.trailingAnchor, constant: 16),
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
            passwordImageView.leadingAnchor.constraint(equalTo: passwordTextFieldContainer.leadingAnchor, constant: 10),
            passwordImageView.centerYAnchor.constraint(equalTo: passwordTextFieldContainer.centerYAnchor)
        ])
    }
    
    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: passwordImageView.trailingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldContainer.trailingAnchor, constant: -16),
            passwordTextField.centerYAnchor.constraint(equalTo: passwordTextFieldContainer.centerYAnchor)
        ])
    }
    
    func setupLoginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.topAnchor.constraint(equalTo: passwordTextFieldContainer.bottomAnchor, constant: 16)
        ])
    }
}

//MARK: Methods for buttons

extension LoginView {
    @objc func loginButtonTapped() {
        if viewModel.authorizeToAccount(login: usernameTextField.text ?? "", password: passwordTextField.text ?? "") {
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                view.endEditing(true)
                sceneDelegate.switchRootVCToTabView()
                viewModel.setAuthorizedFlag()
            }
        } else {
            let alertController = UIAlertController(title: "Ошибка", message: "Введены неправильный логин или пароль", preferredStyle: .alert)
            let repeatAction = UIAlertAction(title: "Повторить", style: .default)
            let cancelAction = UIAlertAction(title: "Отменить", style: .cancel) { [weak self] _ in
                self?.usernameTextField.text = ""
                self?.passwordTextField.text = ""
            }
            alertController.addAction(repeatAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let moveDistance = keyboardFrame.height / 2
        
        self.view.frame.origin.y = -moveDistance
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}

//MARK: TextField Should Return

extension LoginView {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = view.viewWithTag(nextTag) as? UITextField {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
