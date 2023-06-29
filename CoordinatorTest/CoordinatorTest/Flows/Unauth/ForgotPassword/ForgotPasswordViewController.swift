//
//  ForgotPasswordViewController.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class ForgotPasswordViewController: DefaultViewController {
  
  private let loginButton: UIButton = DefaultButton(text: "Login")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stackView.addArrangedSubviews([loginButton])
    
    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
  }
  
  @objc private func didTapLoginButton() {
    AuthCredentialsImp.shared.setup(isAuthorized: true)
    Task {
      await appCoordinator?.start()
    }
  }
}

