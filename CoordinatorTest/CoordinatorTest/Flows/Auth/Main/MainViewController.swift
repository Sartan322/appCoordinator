//
//  MainViewController.swift
//  CoordinatorTest
//
//  Created by Pavel Prokopev on 28.06.2023.
//

import UIKit

class MainViewController: DefaultViewController {
  
  var router: MainRouter?
  
  private let pushButton: UIButton = DefaultButton(text: "Push")
  private let presentButton: UIButton = DefaultButton(text: "Present")
  private let presentNavButton: UIButton = DefaultButton(text: "Present Nav")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    stackView.addArrangedSubviews([pushButton, presentButton, presentNavButton])
    
    pushButton.addTarget(self, action: #selector(didTapPush), for: .touchUpInside)
    presentButton.addTarget(self, action: #selector(didTapPresent), for: .touchUpInside)
    presentNavButton.addTarget(self, action: #selector(didTapPresentNav), for: .touchUpInside)
  }
  
  @objc private func didTapPush() {
    let vc = MainViewController()
    vc.title = "Pushed VC"
    show(vc, sender: nil)
  }
  
  @objc private func didTapPresent() {
    let vc = MainViewController()
    vc.title = "Presented VC"
    present(vc, animated: true)
  }
  
  @objc private func didTapPresentNav() {
    let vc = MainViewController()
    vc.title = "Presented Nav VC"
    present(UINavigationController(rootViewController: vc), animated: true)
  }
}
