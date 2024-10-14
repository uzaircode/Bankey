//
//  LocalState.swift
//  Bankey
//
//  Created by Nik Uzair on 14/10/2024.
//

import Foundation

public class LocalState {
  
  private enum Keys: String {
    case hasOnboarded
  }
  
  public static var hasOnboarded: Bool {
    get {
      return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
    }
    set(newValue) {
      UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
    }
  }
}
