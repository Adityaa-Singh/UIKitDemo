//
//  LoginViewController.swift
//  UIKitDemo
//
//  Created by Kamal Saini on 06/11/26.
//

import UIKit

class LoginViewController: UIViewController {

    
    // MARK: - UI Components
    private let parentView = UIView()
    private let logoImg = UIImageView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let forgotPasswordButton = UIButton()
    private let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setUpConstraints()
        setUpComponents()
    }
    
    
    private func setupUI() {
        navigationController?.isNavigationBarHidden = true
        parentView.backgroundColor = UIColor.appBackground
        
        view.addSubview(parentView)
        parentView.addSubview(logoImg)
        parentView.addSubview(emailTextField)
        parentView.addSubview(passwordTextField)
        parentView.addSubview(forgotPasswordButton)
        parentView.addSubview(loginButton)
    }
    
    func setUpConstraints() {
        
        parentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            parentView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),

            parentView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),

            parentView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),

            parentView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
        
        // logoImg
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        logoImg.topAnchor.constraint( equalTo: self.parentView.topAnchor, constant: 100
        ).isActive = true
        logoImg.centerXAnchor.constraint(equalTo: self.parentView.centerXAnchor).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 125).isActive = true
        logoImg.widthAnchor.constraint(equalToConstant: 125).isActive = true

        
        // Email
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(
            equalTo: self.logoImg.bottomAnchor,
            constant: 50
        ).isActive = true
        
        emailTextField.leadingAnchor.constraint(
            equalTo: self.parentView.leadingAnchor,
            constant: 24
        ).isActive = true
        
        emailTextField.trailingAnchor.constraint(
            equalTo: self.parentView.trailingAnchor,
            constant: -24
        ).isActive = true
        
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        // Password
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(
            equalTo: emailTextField.bottomAnchor,
            constant: 20
        ).isActive = true
        
        passwordTextField.leadingAnchor.constraint(
            equalTo: emailTextField.leadingAnchor
        ).isActive = true
        
        passwordTextField.trailingAnchor.constraint(
            equalTo: emailTextField.trailingAnchor
        ).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Forgot Password
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(
            equalTo: passwordTextField.bottomAnchor,
            constant: 12
        ).isActive = true
        
        forgotPasswordButton.trailingAnchor.constraint(
            equalTo: passwordTextField.trailingAnchor
        ).isActive = true
        
        // Login Button
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(
            equalTo: forgotPasswordButton.bottomAnchor,
            constant: 30
        ).isActive = true
        
        loginButton.leadingAnchor.constraint(
            equalTo: emailTextField.leadingAnchor
        ).isActive = true
        
        loginButton.trailingAnchor.constraint(
            equalTo: emailTextField.trailingAnchor
        ).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setUpComponents() {
        logoImg.image = UIImage(named: "LEGO_logo")
//        titleLabel.configureLabel(
//            text: "Login",
//            
//            textColor: UIColor.label,
//            
//            fontName: nil,
//            
//            fontSize: 34,
//            
//            alignment: .left,
//            
//            numberOfLines: 1
//            
//        )
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
    }

}
