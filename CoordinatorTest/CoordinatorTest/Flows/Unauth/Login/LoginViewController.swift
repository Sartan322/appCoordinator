//
//  LoginViewController.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class LoginViewController: DefaultViewController {
  var router: LoginRouter?
  
  private let loginButton: UIButton = DefaultButton(text: "Login")
  private let forgotPasswordBbutton: UIButton = DefaultButton(text: "Forgot password")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stackView.addArrangedSubviews([loginButton, forgotPasswordBbutton])
    title = "Login VC"
    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    forgotPasswordBbutton.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
  }
  
  @objc private func didTapLoginButton() {
    AuthCredentialsImp.shared.setup(isAuthorized: true)
    Task {
      await appCoordinator?.start()
    }
  }
  
  @objc private func didTapForgotPasswordButton() {
    router?.routeToForgotPassword()
  }
}
