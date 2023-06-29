//
//  AuthCredentials.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import Foundation

protocol AuthCredentials {
  
  var isAuthorized: Bool { get }
}

class AuthCredentialsImp: AuthCredentials {
  
  static let shared = AuthCredentialsImp()
  
  private init() {}
  
  var isAuthorized: Bool {
    UserDefaults.standard.bool(forKey: Keys.isAuthorized.rawValue)
  }
  
  func setup(isAuthorized: Bool) {
    UserDefaults.standard.set(isAuthorized, forKey: Keys.isAuthorized.rawValue)
  }
}

extension AuthCredentialsImp {
  enum Keys: String {
    case isAuthorized
  }
}
