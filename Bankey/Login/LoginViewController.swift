//
//  LoginViewController.swift
//  Bankey
//
//  Created by Nik Uzair on 12/10/2024.
//

import UIKit

protocol LogoutDelegate: AnyObject {
  func didLogout() 
}

protocol LoginViewControllerDelegate: AnyObject {
  func didLogin()
}

class LoginViewController: UIViewController {
  
  let loginView = LoginView()
  let signInButton = UIButton(type: .system)
  let errorMessageLabel = UILabel()
 
  weak var delegate: LoginViewControllerDelegate?
  
  var username: String? {
    return loginView.usernameTextField.text
  }
  
  var password: String? {
    return loginView.passwordTextField.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    signInButton.configuration?.showsActivityIndicator = false
  }
}

extension LoginViewController {
  private func style() {
    loginView.translatesAutoresizingMaskIntoConstraints = false
    signInButton.translatesAutoresizingMaskIntoConstraints = false
    signInButton.configuration = .filled()
    signInButton.configuration?.imagePadding = 8 // for indicating spacing
    signInButton.setTitle("Sign In", for: [])
    signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    
    errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    errorMessageLabel.textAlignment = .center
    errorMessageLabel.textColor = .systemRed
    errorMessageLabel.numberOfLines = 0
    errorMessageLabel.isHidden = true
  }
  
  private func layout() {
    view.addSubview(loginView)
    view.addSubview(signInButton)
    view.addSubview(errorMessageLabel)
    
    // LoginView
    NSLayoutConstraint.activate([
      loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
    ])
    
    // Button
    NSLayoutConstraint.activate([
      signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
      signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
    ])
    
    // ErrorLabel
    NSLayoutConstraint.activate([
      errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
      errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
      errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
    ])
  }
}

extension LoginViewController {
  @objc func signInTapped(sender: UIButton) {
    errorMessageLabel.isHidden = true
    login()
  }
  
  private func login() {
    guard let username = username, let password = password else {
      assertionFailure("Username / password should never be nil")
      return
    }
    
//    if username.isEmpty || password.isEmpty {
//      configureView(withMessage: "Username / password cannot be blank")
//    }
    
    if username == "" && password == "" {
      signInButton.configuration?.showsActivityIndicator = true
      delegate?.didLogin()
    } else {
      configureView(withMessage: "Incorrect username / password")
    }
  }
  
  private func configureView(withMessage message: String) {
    errorMessageLabel.isHidden = false
    errorMessageLabel.text = message
  }
}
