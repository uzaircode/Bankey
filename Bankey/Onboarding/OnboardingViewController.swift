//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Nik Uzair on 13/10/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
  //MARK: - Properties
  let stackView = UIStackView()
  let label = UILabel()
  let imageView = UIImageView()
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
  //MARK: - Selectors
  
  //MARK: - API
  
  //MARK: - Helpers
}

extension OnboardingViewController {
  func style() {
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "delorean")
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.adjustsFontForContentSizeCategory = true
    label.numberOfLines = 0
    label.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989"
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    
  }
  
  func layout() {
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(label)
    view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      stackView.trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.trailingAnchor, multiplier: 1)
    ])
    
    NSLayoutConstraint.activate([
      
    ])
  }
}
