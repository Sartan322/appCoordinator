//
//  LogoutViewController.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class LogoutViewController: DefaultViewController {
  
  private let logoutButton: UIButton = DefaultButton(text: "Logout")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stackView.addArrangedSubviews([logoutButton])
    title = "Logout VC"
    logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
  }
  
  @objc private func didTapLogoutButton() {
    AuthCredentialsImp.shared.setup(isAuthorized: false)
    Task {
      await appCoordinator?.start()
    }
  }
}
