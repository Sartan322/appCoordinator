//
//  LoginRouter.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit


protocol LoginRouter: NSObject {
  var view: UIViewController? { get }
  
  func routeToForgotPassword()
}

class LoginRouterImp: NSObject, LoginRouter {
  
  weak var view: UIViewController?
  
  func routeToForgotPassword() {
    let vc = ForgotPasswordViewController()
    view?.present(vc, animated: true)
  }
}
