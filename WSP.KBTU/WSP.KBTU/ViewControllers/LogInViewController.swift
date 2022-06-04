//
//  ViewController.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    let viewModel = UserViewModel()
    var user: [User] = []
    
    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = NSLocalizedString("Username", comment: "")
        usernameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return usernameLabel
    }()
    
    let usernameTextField = CustomTextField()
//    let usernameTextField: UITextField = {
//        let usernameTextField = UITextField()
//        usernameTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
//        usernameTextField.layer.borderWidth = 1
//        usernameTextField.layer.borderColor = CGColor(red: 0.8, green: 0.85, blue: 0.98, alpha: 1.0)
//        usernameTextField.textContentType = .emailAddress
//        return usernameTextField
//    }()
    
    lazy var usernameStackView: UIStackView = {
        let usernameStackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField])
        usernameStackView.axis = .horizontal
        return usernameStackView
    }()
    
    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = NSLocalizedString("Password", comment: "")
        passwordLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return passwordLabel
    }()
    
    let passwordTextField: CustomTextField = {
        let passwordTextField = CustomTextField()
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    lazy var passwordStackView: UIStackView = {
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        passwordStackView.axis = .horizontal
        passwordStackView.spacing = 0
        return passwordStackView
    }()
    
    let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
        logInButton.layer.cornerRadius = 10
        logInButton.backgroundColor = .systemBlue
        logInButton.setTitle(NSLocalizedString("Log In", comment: ""), for: .normal)
        return logInButton
    }()
    
    lazy var logInStackView: UIStackView = {
        let logInStackView = UIStackView(arrangedSubviews: [usernameStackView, passwordStackView, logInButton])
        logInStackView.axis = .vertical
        logInStackView.alignment = .fill
        logInStackView.spacing = 10
        return logInStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
        configureNavigationBar()
        loadUsers()
    }
    
    private func layoutUI() {
        view.addSubview(logInStackView)
        
        usernameTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalTo(usernameLabel.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        usernameLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(100)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.width.lessThanOrEqualTo(100)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalTo(passwordLabel.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        
        logInStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.title = NSLocalizedString("Log In", comment: "")
    }
    
    @objc func logInPressed() {
        let foundUser = user.first(where: {
            $0.login == usernameTextField.text
        })
        if foundUser?.password == passwordTextField.text {
            let rootVC = NewsViewController()
//            let navigationVC = UINavigationController(rootViewController: rootVC)
//            navigationVC.modalPresentationStyle = .currentContext
            self.navigationController?.pushViewController(rootVC, animated: true)
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid login or password.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func loadUsers() {
        user = viewModel.getUserData()
    }
    

}

