//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Nik Uzair on 14/10/2024.
//

import UIKit

extension UIViewController {
  func setStatusBar() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithTransparentBackground()
    navBarAppearance.backgroundColor = appColor
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
  }
  
  func setTabBarImage(imageName: String, title: String) {
    let configuration = UIImage.SymbolConfiguration(scale: .large)
    let image = UIImage(systemName: imageName, withConfiguration: configuration)
    tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
  }
}
