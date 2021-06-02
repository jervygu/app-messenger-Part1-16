//
//  LoginViewController.swift
//  Messenger
//
//  Created by Jervy Umandap on 6/1/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let container: UIView = {
        let view = UIView()
        return view
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let emailTF: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.placeholder = "Email"
        textField.textColor = .label
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let passwordTF: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.placeholder = "Password"
        textField.textColor = .label
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("CREATE NEW ACCOUNT", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("FORGOTTEN PASSWORD", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.setTitleColor(.label, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .systemBackground

//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            title: "Register",
//            style: .done,
//            target: self,
//            action: #selector(didTapRegister))
        
        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(imageView)
        container.addSubview(dividerView)
        dividerView.tintColor = .black
        container.addSubview(emailTF)
        container.addSubview(passwordTF)
        container.addSubview(loginButton)
        container.addSubview(createAccountButton)
        container.addSubview(forgotPasswordButton)
        
        dividerView.backgroundColor = .secondarySystemFill
        loginButton.backgroundColor = .secondarySystemBackground
        createAccountButton.backgroundColor = .systemGreen
        
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgot), for: .touchUpInside)
        
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
//        scrollView.backgroundColor = .systemOrange
        
        let containerHeight = view.height*0.66
        container.frame = CGRect(
            x: 20,
            y: scrollView.height*0.20,
            width: scrollView.width-40,
            height: containerHeight)
//        container.backgroundColor = .systemPink
        
        let imageSize = container.width/4
        imageView.frame = CGRect(
            x: (container.width-imageSize)/2,
            y: container.height*0.1,
            width: imageSize,
            height: imageSize)
//        imageView.backgroundColor = .systemYellow
        
        emailTF.frame = CGRect(
            x: 0,
            y: imageView.bottom+(container.height*0.1),
            width: container.width,
            height: 40)
//        emailTF.backgroundColor = .systemGreen
        
        dividerView.frame = CGRect(
            x: -2,
            y: emailTF.bottom,
            width: view.width-36,
            height: 1)
//        dividerView.backgroundColor = .black
        
        passwordTF.frame = CGRect(
            x: 0,
            y: dividerView.bottom,
            width: container.width,
            height: 40)
//        passwordTF.backgroundColor = .systemTeal
        
        loginButton.frame = CGRect(
            x: 0,
            y: passwordTF.bottom+5,
            width: container.width,
            height: 40)
//        loginButton.backgroundColor = .systemBlue
        
        createAccountButton.frame = CGRect(
            x: 0,
            y: loginButton.bottom+10,
            width: container.width,
            height: 40)
//        createAccountButton.backgroundColor = .systemGreen
        
        forgotPasswordButton.frame = CGRect(
            x: 0,
            y: createAccountButton.bottom+10,
            width: container.width,
            height: 40)
//        forgotPasswordButton.backgroundColor = .systemGray
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Invalid log in", message: "Please enter all information to log in.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func didTapLogin() {
        
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        
        guard let email = emailTF.text, let password = passwordTF.text,
              !email.isEmpty, !password.isEmpty, password.count >= 8 else {
            alertUserLoginError()
            return
        }
        
        // Firebase login
        
    }
    
    @objc private func didTapForgot() {
        print("Forgotten tapped")
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            didTapLogin()
        }
        
        return true
    }
}
