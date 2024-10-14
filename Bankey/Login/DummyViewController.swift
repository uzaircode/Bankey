//
//  DummyViewController.swift
//  Bankey
//
//  Created by Nik Uzair on 14/10/2024.
//

import UIKit

class DummyViewController: UIViewController {
  //MARK: - Properties
  let stackView = UIStackView()
  let label = UILabel()
  let logoutButton = UIButton(type: .system)
  let resetUserDefaultButton = UIButton(type: .system)
  
  weak var logoutDelegate: LogoutDelegate?
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    style()
    layout()
  }
}

//MARK: - Helpers
extension DummyViewController {
  private func style() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 20
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Welcome"
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    
    logoutButton.translatesAutoresizingMaskIntoConstraints = false
    logoutButton.configuration = .filled()
    logoutButton.setTitle("Logout", for: [])
    logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    
    resetUserDefaultButton.translatesAutoresizingMaskIntoConstraints = false
    resetUserDefaultButton.configuration = .filled()
    resetUserDefaultButton.setTitle("Reset didFinishOnboarding", for: [])
    resetUserDefaultButton.addTarget(self, action: #selector(resetUserDefaultButtonTapped), for: .primaryActionTriggered)
  }
  
  private func layout() {
    stackView.addArrangedSubview(label)
    stackView.addArrangedSubview(logoutButton)
    stackView.addArrangedSubview(resetUserDefaultButton)
    view.addSubview(stackView)
   
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  @objc func logoutButtonTapped(sender: UIButton) {
    logoutDelegate?.didLogout()
  }
  
  @objc func resetUserDefaultButtonTapped(sender: UIButton) {
    UserDefaults.standard.removeObject(forKey: "hasOnboarded")
  }
}
