//
//  AppDelegate.swift
//  Bankey
//
//  Created by Nik Uzair on 12/10/2024.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  let loginViewController = LoginViewController()
  let onboardingContainerViewController = OnboardingContainerViewController()
  let dummyViewController = DummyViewController()
  let mainViewController = MainViewController()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.backgroundColor = .systemBackground
    onboardingContainerViewController.delegate = self
    loginViewController.delegate = self
    dummyViewController.logoutDelegate = self
    
    window?.rootViewController = mainViewController
    window?.makeKeyAndVisible()
    
    return true
  }
}

extension AppDelegate {
  func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
    guard animated, let window = self.window else {
      self.window?.rootViewController = vc
      self.window?.makeKeyAndVisible()
      return
    }
    
    window.rootViewController = vc
    window.makeKeyAndVisible()
    UIView.transition(with: window,
                      duration: 0.3,
                      options: .transitionCrossDissolve,
                      animations: nil,
                      completion: nil)
  }
}

extension AppDelegate: LoginViewControllerDelegate {
  func didLogin() {
    setRootViewController(onboardingContainerViewController)
    if LocalState.hasOnboarded {
      setRootViewController(dummyViewController)
    } else {
      setRootViewController(onboardingContainerViewController)
    }
  }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
  func didFinishOnboarding() {
    setRootViewController(dummyViewController)
    LocalState.hasOnboarded = true
  }
}

extension AppDelegate: LogoutDelegate {
  func didLogout() {
    setRootViewController(loginViewController)
  }
}

