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
  
  let heroImageName: String
  let titleText: String
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
  
  init(heroImageName: String, titleText: String) {
    self.heroImageName = heroImageName
    self.titleText = titleText
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  //MARK: - Selectors
  
  //MARK: - API
  
  //MARK: - Helpers
}

extension OnboardingViewController {
  func style() {
    view.backgroundColor = .systemBackground
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: heroImageName)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.adjustsFontForContentSizeCategory = true
    label.numberOfLines = 0
    label.text = titleText
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
    
  }
}
