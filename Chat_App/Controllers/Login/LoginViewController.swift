//
//  LoginViewController.swift
//  Chat_App
//
//  Created by BuiNgocSon on 5/12/21.
//  Copyright © 2021 BuiNgocSon. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailField:UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField:UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
    private let LoginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
        
    }()
    
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        
        LoginButton.addTarget(self, action: #selector(LoginButtonTapped), for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        // add Subview
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(LoginButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width / 3
        imageView.frame = CGRect(x:(scrollView.width-size)/2,
                                 y:20,
                                 width:size,
                                 height: size)
        emailField.frame = CGRect(x:30,
                                  y:imageView.bottom+10,
                                  width:scrollView.width-60,
                                  height: 50)
        passwordField.frame = CGRect(x:30,
                                  y:emailField.bottom+10,
                                  width:scrollView.width-60,
                                  height: 50)
        LoginButton.frame = CGRect(x:30,
                                  y:passwordField.bottom+10,
                                  width:scrollView.width-60,
                                  height: 50)
    }
    
    @objc private func LoginButtonTapped(){
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text , let password = passwordField.text,
            !email.isEmpty , !password.isEmpty, password.count >= 6 else {
                alertUserLoginError()
                return
        }
        //firebase login
    }
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to log in.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert,animated: true)
        
    }
    
    @objc private func didTapRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            LoginButtonTapped()
        }
        return true
    }
}