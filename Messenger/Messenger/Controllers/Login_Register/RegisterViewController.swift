//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Jervy Umandap on 6/1/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
    
    private let dividerView2: UIView = {
        let view = UIView()
        return view
    }()
    
    private let dividerView3: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
//        imageView.layer.cornerRadius =
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
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
    
    private let firstnameTF: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.placeholder = "First name"
        textField.textColor = .label
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let lastnameTF: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.placeholder = "Last name"
        textField.textColor = .label
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setTitle("REGISTER", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        view.backgroundColor = .systemBackground
        
        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(imageView)
        container.addSubview(dividerView)
//        dividerView.tintColor = .black
        container.addSubview(emailTF)
        container.addSubview(dividerView2)
        container.addSubview(passwordTF)
        container.addSubview(dividerView3)
        container.addSubview(firstnameTF)
        container.addSubview(lastnameTF)
        container.addSubview(registerButton)
        
        dividerView.backgroundColor = .secondarySystemFill
        dividerView2.backgroundColor = .secondarySystemFill
        dividerView3.backgroundColor = .secondarySystemFill
        registerButton.backgroundColor = .systemGreen
        
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        emailTF.delegate = self
        passwordTF.delegate = self
        firstnameTF.delegate = self
        lastnameTF.delegate = self
        
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapChangeProfilePic() {
        print("Change pic tapped")
        presentPhotoActionSheet()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        let containerHeight = view.height*0.90
        container.frame = CGRect(
            x: 20,
            y: scrollView.height-containerHeight-view.safeAreaInsets.top-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: containerHeight)
//        container.backgroundColor = .systemPink
        
        let imageSize = container.width/2.5
        imageView.frame = CGRect(
            x: (container.width-imageSize)/2,
            y: 100,
            width: imageSize,
            height: imageSize)
        imageView.layer.cornerRadius = imageSize/2
//        imageView.backgroundColor = .systemRed
        
        emailTF.frame = CGRect(
            x: 0,
            y: imageView.bottom+10,
            width: container.width,
            height: 40)
//        emailTF.backgroundColor = .systemGreen
        
        dividerView.frame = CGRect(
            x: -2,
            y: emailTF.bottom,
            width: view.width-36,
            height: 1)
//        dividerView.backgroundColor = .systemPink
        
        passwordTF.frame = CGRect(
            x: 0,
            y: dividerView.bottom,
            width: container.width,
            height: 40)
//        passwordTF.backgroundColor = .systemTeal
        
        dividerView2.frame = CGRect(
            x: -2,
            y: passwordTF.bottom,
            width: view.width-36,
            height: 1)
//        dividerView2.backgroundColor = .systemPink
        
        firstnameTF.frame = CGRect(
            x: 0,
            y: dividerView2.bottom,
            width: container.width,
            height: 40)
//        firstnameTF.backgroundColor = .systemGreen
        
        dividerView3.frame = CGRect(
            x: -2,
            y: firstnameTF.bottom,
            width: view.width-36,
            height: 1)
//        dividerView3.backgroundColor = .systemPink
        
        lastnameTF.frame = CGRect(
            x: 0,
            y: dividerView3.bottom,
            width: container.width,
            height: 40)
//        lastnameTF.backgroundColor = .systemGreen
        
        registerButton.frame = CGRect(
            x: 0,
            y: lastnameTF.bottom+10,
            width: container.width,
            height: 40)
        
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Invalid Registration", message: "Please enter all information to create a new account.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func didTapRegister() {
        emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
        firstnameTF.resignFirstResponder()
        lastnameTF.resignFirstResponder()
        
        guard let email = emailTF.text,
              let password = passwordTF.text,
              let firstname = firstnameTF.text,
              let lastname = lastnameTF.text,
              !email.isEmpty,
              !password.isEmpty, password.count >= 8,
              !firstname.isEmpty,
              !lastname.isEmpty else {
            alertUserLoginError()
            return
        }
        
        // Firebase login
        
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            firstnameTF.becomeFirstResponder()
        } else if textField == firstnameTF {
            lastnameTF.becomeFirstResponder()
        } else if textField == lastnameTF {
            didTapRegister()
        }
        
        return true
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(
            title: "Profile Picture",
            message: "How would you like to select a picture?",
            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(
                                title: "Cancel",
                                style: .cancel,
                                handler: nil))
        
        actionSheet.addAction(UIAlertAction(
                                title: "Take Photo",
                                style: .default,
                                handler: { [weak self] (_) in
                                    self?.presentCamera()
                                }))
        
        actionSheet.addAction(UIAlertAction(
                                title: "Choose photo",
                                style: .default,
                                handler: { [weak self] (_) in
                                    self?.presentPhotoPicker()
                                }))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        self.imageView.image = selectedImage
            
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
