//
//  LoginAssembly.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class LoginAssembly {
  
  func assemble() -> (UIViewController, LoginRouter) {
    let router = LoginRouterImp()
    let vc = LoginViewController()
    vc.router = router
    router.view = vc
    
    return (vc, router)
  }
}
